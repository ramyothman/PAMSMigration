﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClientProjectsAnalysisGraphsAll]
	-- Add the parameters for the stored procedure here
@PeriodNumber int,
@PeriodChoice int,
@Current bit,
@ClientID int,
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
create table #tempTable 
(InquiryStatus nvarchar(50),StatusCount int, TotalAmount decimal(18,4),ProductTypeID int)
 
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
 
if(@IsFromToChecked = 0)
Begin
	-- User Choose Month
	if(@PeriodChoice = 0)
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
	--User Choose Quarter
	if(@PeriodChoice = 1)
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
	-- User Choose Year
	else if(@PeriodChoice = 2)
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
insert into #tempTable
     SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount, 
            0 as TotalAmount,ISNull(ProductTypeID,0) ProductTypeID
	FROM         #tempViewSubProjectTotals
	where BranchID = @BranchID and InquiryDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
				            InquiryDate <=   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
	      CustomerID = @ClientID
    group by ProductTypeID 
	Union 
	SELECT      'Offer' as InquiryStatus,Count('Offer') as StatusCount,
				ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount,ISNull(ProductTypeID,0) ProductTypeID
	FROM         #tempViewSubProjectTotals
	where BranchID = @BranchID and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
				          OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))and 
	      CustomerID = @ClientID
	group by ProductTypeID 
	Union 
	SELECT      'Order' as InquiryStatus,Count('Order') as StatusCount,
	 				ISNull(Sum(PriceInEuro),0) as TotalAmount,ISNull(ProductTypeID,0) ProductTypeID
	FROM         #tempViewSubProjectTotals
	where BranchID = @BranchID and OrderDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
				            OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))and 
	      CustomerID = @ClientID
    group by ProductTypeID 
    
    Union 
	SELECT     'Delivered' as InquiryStatus,Count(InquiryNumber) as StatusCount,
	 				ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount,ISNull(ProductTypeID,0) ProductTypeID
	FROM         #tempViewSubProjectTotals
	where BranchID = @BranchID and ShipmentDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
				            ShipmentDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))and 
	      CustomerID = @ClientID --and InquiryStatus = 'Delivered'
    group by ProductTypeID 
	
	Union 
	SELECT      InquiryStatus,Count(InquiryStatus) as StatusCount ,
				ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount,ISNull(ProductTypeID,0) ProductTypeID
	FROM         #tempViewSubProjectTotals
	where BranchID = @BranchID and InquiryStatus IN ('Lost','Cancelled','Regret','LateResponse') and
	      LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
				            LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))and 
	      CustomerID = @ClientID
     group by InquiryStatus, ProductTypeID   
     
     select ProjectTypes.ProjectType InquiryStatus, IsNull(StatusCount,0) StatusCount,
	 IsNull(TotalAmount,0) TotalAmount,ISNull(ProductTypeID,0) ProductTypeID
	from #tempTable Right Outer join ProjectTypes
	on ProjectTypes.ProjectType = #tempTable.InquiryStatus  
     order by ProjectTypes.OrderByType
     
     -- DROP TABLE [dbo].[#tempTable]	
      
    print(@FromDate)
	print(@ToDate)   
END
