-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPrincipleBreakDownGraph]
	-- Add the parameters for the stored procedure here
@PeriodNumber int,
@PeriodChoice int,
@Current bit,
@InquiryStatus nvarchar(50),
@SupplierID int,
@IsFromToChecked bit,
@ChoosenFromDate datetime,
@ChoosenToDate datetime,
@BranchID int
AS
BEGIN
	declare @FromDate as datetime
declare @ToDate as datetime
set @FromDate = @ChoosenFromDate
set @ToDate = @ChoosenToDate
create table #tempViewSubProjectTotals
(CustomerID int null, SupplierID int null, OfferStatus nvarchar(50) null,CompanyName nvarchar(100) null,
CompanyCode nvarchar(15) null, SupplierName nvarchar(100) null, OrderDate datetime null, DeliveredON datetime null,
Delivered bit null, InquiryDate datetime null, PriceInEuro money null, QuotationPriceInEuro money null,
LostDate datetime null, OrderStatusID int null, OrderStatus nvarchar(50) null, OfferDate datetime null, 
LostReasonID int null, ReasonName nvarchar(50) null, LostReasonCode nvarchar(50) null, InquiryNumber nvarchar(50) null,
InquiryTypeID int null, InquiryStatusID int null, InquiryStatusName nvarchar(50) null, IsSubOrder bit null, 
ProductTypeID int null, IsSubOffer bit null, ShipmentDate datetime null, ShipmentPriceInEuro decimal(18,4) null,
BackLog decimal(18,4) null, IsPrincipale bit null, HasSubSuppliers bit null, ProjectTypeID int null,
InquiryType nvarchar(50) null, InquiryStatus nvarchar(50) null, CompletedGoodsPaidON datetime null,
IsCompletedGoodsPaid bit null, BranchID int null, SupplierBranchID int null, IsGeneral bit null, 
CompletedOn datetime null, PaidAmountInEuro decimal(18,2) null, row bigint null)
insert into #tempViewSubProjectTotals select * from viewSubProjectTotals
 
 
-- User Choose Month
if(@PeriodChoice = 0)
Begin
	if(@IsFromToChecked = 0)
    Begin	
		if(@Current = 'true')
		begin
			set @FromDate = DATEADD(month, -@PeriodNumber ,getdate())
			set @ToDate = getdate()
		end
		else
		begin
			set @FromDate = DATEADD(month, -@PeriodNumber +1,DATEADD(month,-1, getdate()))
			set @ToDate = DATEADD(month,-1, getdate())
		end
		
		SET @FromDate = DATEADD(DD, 1 - DAY(@FromDate), @FromDate)
		
		print(@FromDate)
		print(@ToDate)
		
		SELECT @ToDate = dateadd(mm,1,@ToDate - day(@ToDate)+1)-1
		SELECT @FromDate = (CAST(STR(MONTH(@FromDate))+'/'+STR(01)+'/'+STR(YEAR(@FromDate)) AS DateTime))
    END
 END
    --User Choose Quarter
else if(@PeriodChoice = 1)
Begin
	if(@IsFromToChecked = 0)
    Begin
		if(@Current = 'true')
		begin
			set @FromDate = DATEADD(month, -(@PeriodNumber *3) ,getdate())
			set @ToDate = getdate()
		end
		else
		begin
			set @FromDate = DATEADD(month, -(@PeriodNumber *3) +1,DATEADD(month,-4, getdate()))
			set @ToDate = DATEADD(month,-1, getdate())
		end
		
		set @FromDate = [dbo].[GetFirstDayOfQuarter](@FromDate)	
		
		print(@FromDate)
		print(@ToDate)
		
		SELECT @ToDate = dateadd(mm,1,@ToDate - day(@ToDate)+1)-1
		SELECT @FromDate = (CAST(STR(MONTH(@FromDate))+'/'+STR(01)+'/'+STR(YEAR(@FromDate)) AS DateTime))
    END
END
-- User Choose Year
else if(@PeriodChoice = 2)
Begin
	if(@IsFromToChecked = 0)
    Begin	
		if(@Current = 'true')
		begin
			set @FromDate = DATEADD(year, -@PeriodNumber ,getdate())
			set @ToDate = getdate()
		end
		else
		begin
			set @FromDate = DATEADD(year, -@PeriodNumber +1,DATEADD(year,-1, getdate()))
			set @ToDate = DATEADD(year,-1, getdate())
		end
		--print(@FromDate + ',' + @ToDate + '')
		
		SELECT @ToDate = dateadd(mm,1,@ToDate - day(@ToDate)+1)-1
		SELECT @FromDate = (CAST(STR(MONTH(@FromDate))+'/'+STR(01)+'/'+STR(YEAR(@FromDate)) AS DateTime))
   END 
END
select * from (
( Select InquiryStatus,
          TotalAmount,
          StatusCount,
          ProductTypeID   
  From (
  Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,ISNull(ProductTypeID,0) ProductTypeID         
         from ( SELECT  InquiryStatus,Count(InquiryStatus) as StatusCount,
						(CASE WHEN InquiryStatus IN ('Order') 
                        THEN ISNull(Sum(PriceInEuro),0) 
                        WHEN InquiryStatus IN ('Offer','Lost','LateResponse','Regret','Cancelled','Canceled')
                        THEN ISNull(Sum(QuotationPriceInEuro),0) 
                        ELSE  ISNull(Sum(ShipmentPriceInEuro),0) 
                        END )as TotalAmount,ISNull(ProductTypeID,0) ProductTypeID
				FROM         #tempViewSubProjectTotals
				where BranchID = @BranchID and OfferDate is not null and 
				      OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
					  OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
					  SupplierID = @SupplierID and InquiryStatus<>'Inquiry' AND InquiryStatus<>'Regret'
					  and InquiryStatus<>'Delivered' and InquiryStatus<>'Order' and row = 1 
					  --and InquiryStatus<>'GoodsPaid'
					  --and InquiryStatus<>'Completed'
					  --AND InquiryNumber IN (SELECT [InquiryNumber]  
       --                                     FROM [dbo].[ProjectsHistory]
       --                                     WHERE [ProjectTypeID] = 2) 
			   Group by InquiryStatus,ProductTypeID
	          ) as tbl        
         Group by InquiryStatus,ProductTypeID
     )t,  ProjectTypes	
    where t.InquiryStatus = ProjectTypes.ProjectType   
    )
  union
  ( Select InquiryStatus,
          TotalAmount,
          StatusCount,
          ProductTypeID   
  From (
  Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,ISNull(ProductTypeID,0) ProductTypeID         
         from ( SELECT  'Booked Order' InquiryStatus,Count(InquiryStatus) as StatusCount,
						 ISNull(Sum(PriceInEuro),0) TotalAmount,ISNull(ProductTypeID,0) ProductTypeID
				FROM         #tempViewSubProjectTotals
				where BranchID = @BranchID and OfferDate is not null and 
				      OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
					  OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
					  SupplierID = @SupplierID 
					  and (InquiryStatus='Delivered' or InquiryStatus='Order') and row = 1 
					  -- or InquiryStatus ='GoodsPaid'
					  --or InquiryStatus='Completed'
					  
					  --AND InquiryNumber IN (SELECT [InquiryNumber]  
       --                                     FROM [dbo].[ProjectsHistory]
       --                                     WHERE [ProjectTypeID] = 2) 
			   Group by InquiryStatus, ProductTypeID
	          ) as tbl        
         Group by InquiryStatus, ProductTypeID
     )t,  ProjectTypes	
    where t.InquiryStatus  Like '%' + ProjectTypes.ProjectType  +'%' 
    )
    )as t ,ProjectTypes
    where t.InquiryStatus Like '%' +  ProjectType+'%'
    order by OrderByType
  
 --   (
 --    Select InquiryStatus,
 --         TotalAmount,
 --         StatusCount,
 --         ProductTypeID   
 -- From (
 -- Select InquiryStatus,
 --        ISNull(SUM(TotalAmount),0) as TotalAmount,
 --        SUM(StatusCount) as StatusCount,ISNull(ProductTypeID,0) ProductTypeID         
 --        from ( SELECT  'Delivered' InquiryStatus,
 --                       Count(InquiryNumber) as StatusCount,
	--					ISNull(Sum(PriceInEuro),0) as TotalAmount,
	--					ProductTypeID 
	--			FROM  GetAllPartialShipment
	--			where OfferDate is not null and 
	--                  OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
	--				OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
	--				  SupplierID = @SupplierID --and InquiryStatus<>'Inquiry' AND InquiryStatus<>'Regret' 
	--				  --AND InquiryNumber IN (SELECT [InquiryNumber]  
 --      --                                     FROM [dbo].[ProjectsHistory]
 --      --                                     WHERE [ProjectTypeID] = 2) 
	--		   Group by ProductTypeID 
	--          ) as tbl        
 --        Group by InquiryStatus, ProductTypeID
 --    )t,  ProjectTypes	
 --   where t.InquiryStatus = ProjectTypes.ProjectType
 --)
  --order by ProjectTypes.OrderByType
END
