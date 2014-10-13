-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetManagementProjectsAnalysisGraphs]
	-- Add the parameters for the stored procedure here
@PeriodNumber int,
@PeriodChoice int,
@Current bit,
@InquiryStatus nvarchar(50),
@IsFromToChecked bit,
@ChoosenFromDate datetime,
@ChoosenToDate datetime,
@BranchID int
AS
BEGIN
declare @sql nvarchar(max)
declare  @d datetime 
declare @FromDate as datetime
declare @ToDate as datetime
set @FromDate = @ChoosenFromDate
set @ToDate = @ChoosenToDate
create table #tempTable 
(InquiryStatus nvarchar(50), TotalAmount decimal(18,4),StatusCount int,
 SelecetdDate nvarchar(100))
 
create table #AllDatesRange (DateRange nvarchar(100))
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
	
	set @d= @FromDate 
	while @d < @ToDate 
	Begin 
		 insert into #AllDatesRange 
		        values (Convert(nvarchar(5),Month(@d),100) + '-' + Convert(nvarchar(5),Year(@d),100))
		 set @d = DATEADD(month,1,@d)
	END
   if(@InquiryStatus = 'Inquiry')	
   insert into #tempTable
         Select InquiryStatus,
         0 as TotalAmount,
         SUM(StatusCount) as StatusCount,
         Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
         from ( SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount,
						 0 as TotalAmount, 
						 YEAR(InquiryDate) AS Year,Month(InquiryDate) AS Month
				FROM         #tempViewSubProjectTotals
				where  (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID  and (IsPrincipale = 'True' or HasSubSuppliers ='True') and  IsSubOffer = 'False' and InquiryDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
			   Group by YEAR(InquiryDate),Month(InquiryDate)
			  ) as tbl 
         where InquiryStatus = @InquiryStatus    
         Group by InquiryStatus,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
         order by InquiryStatus  
  else if(@InquiryStatus = 'Offer')	
  insert into #tempTable
         Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
         from ( SELECT  'Offer' as InquiryStatus,Count('Offer') as StatusCount,
						 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
						 YEAR(OfferDate) AS Year,Month(OfferDate) AS Month
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and OfferDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 
			   Group by YEAR(OfferDate),Month(OfferDate)
			  ) as tbl 
         where InquiryStatus = @InquiryStatus    
         Group by InquiryStatus,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
         order by InquiryStatus  
   else if(@InquiryStatus = 'Order')
   insert into #tempTable	
         Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
         from ( SELECT  'Order' as InquiryStatus,Count('Order') as StatusCount,
						 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
						 YEAR(OrderDate) AS Year,Month(OrderDate) AS Month
				FROM         viewSubProjectTotals
				where  (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and OrderDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 AND IsSubOrder ='false'  and row = 1 
			   Group by YEAR(OrderDate),Month(OrderDate)
			  ) as tbl 
         where InquiryStatus = @InquiryStatus    
         Group by InquiryStatus,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
         order by InquiryStatus    
   else if(@InquiryStatus = 'Delivered' )
   insert into #tempTable	
         Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
         from ( SELECT  'Delivered' as InquiryStatus,Count('Delivered') as StatusCount,
						 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
						 YEAR(DeliveredON) AS Year,Month(DeliveredON) AS Month
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and DeliveredON between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 AND InquiryStatus = @InquiryStatus   
			   Group by YEAR(DeliveredON),Month(DeliveredON)
			  ) as tbl 
        -- where InquiryStatus = @InquiryStatus    
         Group by InquiryStatus,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
         order by InquiryStatus
   else 
   insert into #tempTable
       Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
         from ( SELECT  InquiryStatus,Count(InquiryStatus) as StatusCount,
						 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
						 YEAR(LostDate) AS Year,Month(LostDate) AS Month
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and LostDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					  and InquiryStatus IN ('Lost','Regret','Cancelled','LateResponse')
			   Group by YEAR(LostDate),Month(LostDate),InquiryStatus
			  ) as tbl 
         where InquiryStatus = @InquiryStatus    
         Group by InquiryStatus,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
         order by InquiryStatus     
    
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
	set @d= @FromDate 
	while @d < @ToDate 
	Begin 
		 insert into #AllDatesRange 
		        values ('Q.' + Convert(nvarchar(5),datepart(qq,@d),100) + ' - ' + Convert(nvarchar(5),Year(@d),100))
		 set @d = DATEADD(month,3,@d)
	END
	if(@InquiryStatus = 'Inquiry')	
	insert into #tempTable
        Select InquiryStatus,
         0 as TotalAmount,
         SUM(StatusCount) as StatusCount,
         'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
         from (    
	          SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount,
						 0 as TotalAmount, 
						 YEAR(InquiryDate) AS Year, datepart(qq,InquiryDate) AS Quarter
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and InquiryDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 
			   Group by YEAR(InquiryDate),datepart(qq,InquiryDate)
	          ) as tbl
         where InquiryStatus = @InquiryStatus 
         Group by InquiryStatus,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
         order by InquiryStatus  
    else if(@InquiryStatus = 'Offer')
    insert into #tempTable	
        Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
         from (    
	          SELECT  'Offer' as InquiryStatus,Count('Offer') as StatusCount,
						 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
						 YEAR(OfferDate) AS Year, datepart(qq,OfferDate) AS Quarter
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and OfferDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 
			   Group by YEAR(OfferDate),datepart(qq,OfferDate)
	          ) as tbl
         where InquiryStatus = @InquiryStatus 
         Group by InquiryStatus,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
         order by InquiryStatus
 else if(@InquiryStatus = 'Order')	
        insert into #tempTable
        Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
         from (    
	          SELECT  'Order' as InquiryStatus,Count('Order') as StatusCount,
						 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
						 YEAR(OrderDate) AS Year, datepart(qq,OrderDate) AS Quarter
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and  IsSubOffer = 'False' and OrderDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 and row = 1 
			   Group by YEAR(OrderDate),datepart(qq,OrderDate)
	          ) as tbl
         where InquiryStatus = @InquiryStatus 
         Group by InquiryStatus,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
         order by InquiryStatus            
       
 else if(@InquiryStatus = 'Delivered')	
 insert into #tempTable
        Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
         from (    
	          SELECT  'Delivered' as InquiryStatus,Count('Delivered') as StatusCount,
						 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
						 YEAR(DeliveredON) AS Year, datepart(qq,DeliveredON) AS Quarter
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and DeliveredON between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					  and InquiryStatus = 'Delivered'
			   Group by YEAR(DeliveredON),datepart(qq,DeliveredON)
	          ) as tbl
         where InquiryStatus = @InquiryStatus 
         Group by InquiryStatus,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
         order by InquiryStatus              
   else 
   insert into #tempTable
        Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
         from (    
	          SELECT InquiryStatus,Count(InquiryStatus) as StatusCount,
						 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
						 YEAR(LostDate) AS Year, datepart(qq,LostDate) AS Quarter
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and  LostDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					  and InquiryStatus IN ('Lost','Regret','Cancelled','LateResponse')
			   Group by YEAR(LostDate),datepart(qq,LostDate),InquiryStatus
	          ) as tbl
         where InquiryStatus = @InquiryStatus 
         Group by InquiryStatus,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
         order by InquiryStatus   
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
   set @d= @FromDate 
	while @d < @ToDate 
	Begin 
		 insert into #AllDatesRange 
		        values (Convert(nvarchar(5),Year(@d),100))
		 set @d = DATEADD(year,1,@d)
	END
	
if(@InquiryStatus = 'Inquiry')
insert into #tempTable	
   Select InquiryStatus,
         0 as TotalAmount,
         SUM(StatusCount) as StatusCount,
         [Year] as SelecetdDate 
         from (     SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount,
						 0 as TotalAmount, 
						 YEAR(InquiryDate) AS Year
					FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and InquiryDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 
			   Group by YEAR(InquiryDate)
	          ) as tbl
         where InquiryStatus = @InquiryStatus  
         Group by InquiryStatus,[Year]
         order by InquiryStatus   
else if(@InquiryStatus = 'Offer')
insert into #tempTable	
   Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         [Year] as SelecetdDate 
         from (     SELECT  'Offer' as InquiryStatus,Count('Offer') as StatusCount,
						 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
						 YEAR(OfferDate) AS Year
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and OfferDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 
			   Group by YEAR(OfferDate)
	          ) as tbl
         where InquiryStatus = @InquiryStatus  
         Group by InquiryStatus,[Year]
         order by InquiryStatus  
 else if(@InquiryStatus = 'Order')	
 insert into #tempTable
   Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         [Year] as SelecetdDate 
         from (     SELECT  'Order' as InquiryStatus,Count('Order') as StatusCount,
						 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
						 YEAR(OrderDate) AS Year
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and OrderDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
				 and row = 1 
			   Group by YEAR(OrderDate)
	          ) as tbl
         where InquiryStatus = @InquiryStatus  
         Group by InquiryStatus,[Year]
         order by InquiryStatus                
 else if(@InquiryStatus = 'Delivered')	
 insert into #tempTable
   Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         [Year] as SelecetdDate 
         from (     SELECT  'Delivered' as InquiryStatus,Count('Delivered') as StatusCount,
						 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
						 YEAR(DeliveredON) AS Year
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and DeliveredON between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 
			   Group by YEAR(DeliveredON)
	          ) as tbl
         where InquiryStatus = @InquiryStatus  
         Group by InquiryStatus,[Year]
         order by InquiryStatus 
 else 
 insert into #tempTable
   Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         [Year] as SelecetdDate 
         from (     SELECT  InquiryStatus,Count(InquiryStatus) as StatusCount,
						 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
						 YEAR(LostDate) AS Year
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and LostDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					  and InquiryStatus IN ('Lost','Regret','Cancelled','LateResponse')
			   Group by YEAR(LostDate),InquiryStatus
	          ) as tbl
         where InquiryStatus = @InquiryStatus  
         Group by InquiryStatus,[Year]
         order by InquiryStatus 
END
-- User Choose Week
else if(@PeriodChoice = 3)
Begin
	--if(@IsFromToChecked = 0)
 --   Begin	
	--	if(@Current = 'true')
	--	begin
	--		set @FromDate = DATEADD(year, -@PeriodNumber ,getdate())
	--		set @ToDate = getdate()
	--	end
	--	else
	--	begin
	--		set @FromDate = DATEADD(day, -@PeriodNumber +7,DATEADD(day,-7, getdate()))
	--		set @ToDate = DATEADD(day,-1, getdate())
	--	end
	--	--print(@FromDate + ',' + @ToDate + '')
		
	--	SELECT @ToDate = dateadd(mm,1,@ToDate - day(@ToDate)+1)-1
	--	SELECT @FromDate = (CAST(STR(MONTH(@FromDate))+'/'+STR(01)+'/'+STR(YEAR(@FromDate)) AS DateTime))
 --  END 
  set @d= @FromDate 
  DECLARE @week int
   declare @TempToDate datetime 
   declare @TempFromDate DATETIME 
	while @d < @ToDate 
	Begin 
	     SELECT @week = DATEPART(wk,@d)
	     --SELECT @TempFromDate = dbo.F_START_OF_WEEK(@d,1)
	     --SELECT @TempToDate = dbo.F_START_OF_WEEK(@d,7)		 
		 insert into #AllDatesRange 
		        values ('CW.' + Convert(nvarchar(5), @week,100)
		              + ' - ' 		  
		              + Convert(nvarchar(5),Year(@d),100)		    
		             )
		 set @d = DATEADD(day,7,@d)
	END      
	
if(@InquiryStatus = 'Inquiry')
insert into #tempTable	
   Select InquiryStatus,
         0 as TotalAmount,
         SUM(StatusCount) as StatusCount,
         'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' + 
         Convert(nvarchar(5),[Year],100) as SelecetdDate 
         from (     SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount,
						 0 as TotalAmount, 
						 YEAR(InquiryDate) AS YEAR,
						 DATEPART(wk,InquiryDate) AS [Week]
					FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and InquiryDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 
			   Group BY DATEPART(wk,InquiryDate), YEAR(InquiryDate)
	          ) as tbl
         where InquiryStatus = @InquiryStatus  
         Group by InquiryStatus,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)
         order by InquiryStatus   
else if(@InquiryStatus = 'Offer')
insert into #tempTable	
   Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
         from (     SELECT  'Offer' as InquiryStatus,Count('Offer') as StatusCount,
						 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
						 YEAR(OfferDate) AS Year,
						 DATEPART(wk,OfferDate) AS [Week]
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and OfferDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 
			   Group BY DATEPART(wk,OfferDate), YEAR(OfferDate) 
	          ) as tbl
         where InquiryStatus = @InquiryStatus  
         Group by InquiryStatus,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
         order by InquiryStatus  
 else if(@InquiryStatus = 'Order')	
 insert into #tempTable
   Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
         from (     SELECT  'Order' as InquiryStatus,Count('Order') as StatusCount,
						 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
						 YEAR(OrderDate) AS Year,
						 DATEPART(wk,OrderDate) AS [Week]
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and OrderDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 and row = 1 
			   Group by  DATEPART(wk,OrderDate),YEAR(OrderDate)
	          ) as tbl
         where InquiryStatus = @InquiryStatus  
         Group by InquiryStatus,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
         order by InquiryStatus                
 else if(@InquiryStatus = 'Delivered')	
 insert into #tempTable
   Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
         from (     SELECT  'Delivered' as InquiryStatus,Count('Delivered') as StatusCount,
						 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
						 YEAR(DeliveredON) AS Year,
						 DATEPART(wk,DeliveredON) AS [Week]
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and DeliveredON between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					 
			   Group by DATEPART(wk,DeliveredON),YEAR(DeliveredON)
	          ) as tbl
         where InquiryStatus = @InquiryStatus  
         Group by InquiryStatus,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
         order by InquiryStatus 
 else 
 insert into #tempTable
   Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
         from (     SELECT  InquiryStatus,Count(InquiryStatus) as StatusCount,
						 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
						 YEAR(LostDate) AS Year,
						 DATEPART(wk,LostDate) AS [Week]
				FROM         #tempViewSubProjectTotals
				where (SupplierBranchID = @BranchID OR IsGeneral = 'True') and BranchID = @BranchID and (IsPrincipale = 'True' or HasSubSuppliers ='True') and IsSubOffer = 'False' and LostDate between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
					  and InquiryStatus IN ('Lost','Regret','Cancelled','LateResponse')
			   Group by DATEPART(wk,LostDate),YEAR(LostDate),InquiryStatus
	          ) as tbl
         where InquiryStatus = @InquiryStatus  
         Group by InquiryStatus,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
         order by InquiryStatus 
END
    PRINT('HI')
--select * from #tempTable
	select ISNull(InquiryStatus,@InquiryStatus) InquiryStatus, IsNull(TotalAmount,0) TotalAmount,
	IsNull(StatusCount,0) StatusCount , #AllDatesRange.DateRange as SelecetdDate from 
	#tempTable Right Outer join #AllDatesRange
	on #AllDatesRange.DateRange = #tempTable.SelecetdDate
	 
   
	--DROP TABLE [dbo].[#tempTable]	
	--DROP TABLE [dbo].[#AllDatesRange]
	
    print(@FromDate)
	print(@ToDate)   
END
