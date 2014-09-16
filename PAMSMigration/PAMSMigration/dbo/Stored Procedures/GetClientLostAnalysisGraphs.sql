-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClientLostAnalysisGraphs]
	-- Add the parameters for the stored procedure here
@PeriodNumber int,
@PeriodChoice int,
@Current bit,
@InquiryStatus nvarchar(50),
@ClientID int,
@IsFromToChecked bit,
@ChoosenFromDate datetime,
@ChoosenToDate datetime,
@IsOffer bit,
@BranchID int
AS
BEGIN
declare @sql nvarchar(max)
declare @FromDate as datetime
declare @ToDate as datetime
set @FromDate = @ChoosenFromDate
set @ToDate = @ChoosenToDate
create table #tempViewSubFinalProjects 
(InquiryStatus nvarchar(50) null,CustomerID int null, SupplierID int null, CompanyName nvarchar(100) null,
 SupplierName nvarchar(100) null, InquiryDate datetime null, PriceInEuro money null, QuotationPriceInEuro money null,
 OrderDate datetime null, OrderStatusID int null, OrderStatus nvarchar(50) null, TotalAmount decimal (19,4) null,
 LostReasonID int null, ReasonName nvarchar(50) null, ProductTypeID int null, LostReasonCode nvarchar(50) null,
 CompanyCode nvarchar(15) null, BranchID int null)
 
 insert into #tempViewSubFinalProjects select * from viewSubFinalProjects
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
	if @IsOffer = 0  
   Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,LostReasonCode, ReasonName,
         SUM(StatusCount) as StatusCount,ISNULL(ProductTypeID,0) ProductTypeID --,
        -- Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
         from (  SELECT     InquiryStatus, YEAR(InquiryDate) AS Year,Month(InquiryDate) AS Month, COUNT(InquiryStatus) AS StatusCount,
                            CustomerID, SupplierID, SupplierName,CompanyName, LostReasonCode, ReasonName, 
                            OrderStatus, OrderStatusID, SUM(TotalAmount) AS TotalAmount,
                            ISNULL(ProductTypeID,0) ProductTypeID
				 FROM         #tempViewSubFinalProjects
				 where BranchID = @BranchID and InquiryDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
				                       InquiryDate<= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))
				 GROUP BY   YEAR(InquiryDate),ProductTypeID, InquiryStatus, CustomerID, SupplierID, SupplierName, CompanyName, 
				            OrderStatus, OrderStatusID,Month(InquiryDate), LostReasonCode, ReasonName
	          ) as tbl
         where InquiryStatus = @InquiryStatus  and CustomerID = @ClientID  
         Group by InquiryStatus,LostReasonCode,ProductTypeID, ReasonName--,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
         order by StatusCount  ,TotalAmount  asc     
       
END
--User Choose Quarter
if(@PeriodChoice = 1)
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
	if @IsOffer = 0  
   Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount, LostReasonCode, ReasonName, 
         SUM(StatusCount) as StatusCount,ISNULL(ProductTypeID,0) ProductTypeID--,
        -- 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
         from (  SELECT     InquiryStatus, Year(InquiryDate) as Year, datepart(qq,InquiryDate) AS Quarter, COUNT(InquiryStatus) AS StatusCount,
                            CustomerID, SupplierID, SupplierName,CompanyName,LostReasonCode, ReasonName, 
                            OrderStatus, OrderStatusID, SUM(TotalAmount) AS TotalAmount,ISNULL(ProductTypeID,0) ProductTypeID
				 FROM         #tempViewSubFinalProjects
				 where BranchID = @BranchID and InquiryDate >=  (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
				                        InquiryDate <=    (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))
				 GROUP BY   InquiryStatus, CustomerID, SupplierID, SupplierName, CompanyName, 
				            OrderStatus, OrderStatusID,ProductTypeID,datepart(qq,InquiryDate),Year(InquiryDate), LostReasonCode, ReasonName
	          ) as tbl
         where InquiryStatus = @InquiryStatus  and CustomerID = @ClientID
         Group by InquiryStatus,LostReasonCode,ProductTypeID, ReasonName--,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
         order by StatusCount ,TotalAmount  asc        
       
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
if @IsOffer = 0  
   Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount, LostReasonCode, ReasonName,ISNULL(ProductTypeID,0) ProductTypeID
        -- [Year] as SelecetdDate 
         from (  SELECT     InquiryStatus, YEAR(InquiryDate) AS Year, COUNT(InquiryStatus) AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, LostReasonCode, ReasonName,
                            OrderStatus, OrderStatusID, SUM(TotalAmount) AS TotalAmount,ISNULL(ProductTypeID,0) ProductTypeID
				 FROM         #tempViewSubFinalProjects
				 where BranchID = @BranchID and InquiryDate >=  (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
				                         InquiryDate <=   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))
				 GROUP BY   YEAR(InquiryDate), InquiryStatus, CustomerID, SupplierID, SupplierName, CompanyName, 
				            OrderStatus, OrderStatusID,ProductTypeID, LostReasonCode, ReasonName
	          ) as tbl
         where InquiryStatus = @InquiryStatus  and CustomerID = @ClientID
         Group by InquiryStatus,LostReasonCode,ProductTypeID, ReasonName  --,[Year]
         order by StatusCount,TotalAmount    asc       
       
END
          
if @IsOffer = 1 
 Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount, LostReasonCode, ReasonName,ISNULL(ProductTypeID,0) ProductTypeID
        -- [Year] as SelecetdDate 
         from (  SELECT     InquiryStatus, COUNT(InquiryStatus) AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, LostReasonCode, ReasonName,
                            OrderStatus, OrderStatusID, ISNull(Sum(QuotationPriceInEuro),0) AS TotalAmount,ISNULL(ProductTypeID,0) ProductTypeID
				 FROM       dbo.viewSubProjectTotals
				 where BranchID = @BranchID and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
                              OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))
				 GROUP BY  InquiryStatus, CustomerID, SupplierID, SupplierName, CompanyName, 
				            OrderStatus, OrderStatusID,ProductTypeID, LostReasonCode, ReasonName
	          ) as tbl
         where InquiryStatus = @InquiryStatus  and CustomerID = @ClientID
         Group by InquiryStatus,LostReasonCode,ProductTypeID, ReasonName  --,[Year]
         order by StatusCount,TotalAmount    asc
    
    
    print(@FromDate)
	print(@ToDate)   
END
