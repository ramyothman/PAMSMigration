-- =============================================
-- Author:		<=Author,,Name>
-- Create date: <=Create Date,,>
-- Description:	<=Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPrincipleProjectsAnalysisGraphs]
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

declare @sql nvarchar(max)
declare  @d datetime 
declare @FromDate as datetime
declare @ToDate as datetime

if(@Current = 'false')
set @PeriodNumber = @PeriodNumber - 1

set @FromDate = @ChoosenFromDate
set @ToDate = @ChoosenToDate

 set @ToDate =  dateadd(dd,1,@ToDate)
Select @ToDate = Convert(DateTime, Convert(VarChar, @ToDate , 101))

  DECLARE @week int

	   declare @TempToDate datetime 
	   declare @TempFromDate DATETIME 

create table #tempTable 
(InquiryStatus nvarchar(50), TotalAmount decimal(18,4),StatusCount int,
 SelecetdDate nvarchar(100),ProductTypeID int)
 
create table #AllDatesRange (DateRange nvarchar(100))

if(@SupplierID >0)
BEGIN
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
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount,
							 0 as TotalAmount, 
							 YEAR(InquiryDate) AS Year,Month(InquiryDate) AS Month,
							 ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and InquiryDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  InquiryDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and
						  SupplierID = @SupplierID
				   Group by YEAR(InquiryDate),Month(InquiryDate), ProductTypeID
				  ) as tbl 
			 where InquiryStatus = @InquiryStatus    
			 Group by ProductTypeID,InquiryStatus,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus  
	  else if(@InquiryStatus = 'Offer')	
	  insert into #tempTable
			 Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  'Offer' as InquiryStatus,Count('Offer') as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(OfferDate) AS Year,Month(OfferDate) AS Month,
							 ISNull(ProductTypeID,0)  ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by YEAR(OfferDate),Month(OfferDate),ProductTypeID
				  ) as tbl 
			 where InquiryStatus = @InquiryStatus    
			 Group by ProductTypeID,InquiryStatus,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus  
	   else if(@InquiryStatus = 'Order')
	   insert into #tempTable	
			 Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  'Order' as InquiryStatus,Count('Order') as StatusCount,
							 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
							 YEAR(OrderDate) AS Year,Month(OrderDate) AS Month,
							 ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OrderDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by YEAR(OrderDate),Month(OrderDate),ProductTypeID
				  ) as tbl 
			 where InquiryStatus = @InquiryStatus    
			 Group by ProductTypeID,InquiryStatus,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus    
	   else if(@InquiryStatus = 'Delivered' )
	   insert into #tempTable	
			 Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  'Delivered' as InquiryStatus,Count('Delivered') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(ShipmentDate) AS Year,Month(ShipmentDate) AS Month
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and ShipmentDate is not null and 
						  ShipmentDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  ShipmentDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True')  and 
						  SupplierID = @SupplierID --AND InquiryStatus = 'Delivered' 
				   Group by YEAR(ShipmentDate),Month(ShipmentDate), ProductTypeID
				  ) as tbl 
			-- where InquiryStatus = @InquiryStatus    
			 Group by InquiryStatus,ProductTypeID,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus
		 else if(@InquiryStatus = 'GoodsPaid' )
	   insert into #tempTable	
			 Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  'GoodsPaid' as InquiryStatus,Count('GoodsPaid') as StatusCount,
							 ISNull(Sum(PaidAmountInEuro),0) as TotalAmount, 
							 YEAR(CompletedGoodsPaidON) AS Year,Month(CompletedGoodsPaidON) AS Month
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedGoodsPaidON is not null and 
						  CompletedGoodsPaidON >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  CompletedGoodsPaidON <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True')  and 
						  SupplierID = @SupplierID --AND InquiryStatus = 'Delivered' 
				   Group by YEAR(CompletedGoodsPaidON),Month(CompletedGoodsPaidON), ProductTypeID
				  ) as tbl 
			-- where InquiryStatus = @InquiryStatus    
			 Group by InquiryStatus,ProductTypeID,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus	 
	   else if(@InquiryStatus = 'Completed' )
	   insert into #tempTable	
			 Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  'Completed' as InquiryStatus,Count('Completed') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(CompletedOn) AS Year,Month(CompletedOn) AS Month
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedOn is not null and 
						  CompletedOn >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  CompletedOn <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID --AND InquiryStatus = 'Delivered' 
				   Group by YEAR(CompletedOn),Month(CompletedOn), ProductTypeID
				  ) as tbl 
			-- where InquiryStatus = @InquiryStatus    
			 Group by InquiryStatus,ProductTypeID,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus	 
	   else 
	   insert into #tempTable
		   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  InquiryStatus,Count(InquiryStatus) as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(LostDate) AS Year,Month(LostDate) AS Month
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True')  and 
						  SupplierID = @SupplierID and InquiryStatus IN ('Lost','Regret','Cancelled','LateResponse')
				   Group by YEAR(LostDate),Month(LostDate),InquiryStatus,ProductTypeID
				  ) as tbl 
			 where InquiryStatus = @InquiryStatus    
			 Group by InquiryStatus,ProductTypeID,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
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
			
			print(@FromDate)
			
			set @FromDate = [dbo].[GetFirstDayOfQuarter](@FromDate)	
			
			print('hhhh')
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
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (    
				  SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount,
							 0 as TotalAmount, 
							 YEAR(InquiryDate) AS Year, datepart(qq,InquiryDate) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and InquiryDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  InquiryDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True')  and 
						  SupplierID = @SupplierID
				   Group by YEAR(InquiryDate),datepart(qq,InquiryDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus,ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
			 order by InquiryStatus  
		else if(@InquiryStatus = 'Offer')
		insert into #tempTable	
			Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate
			 ,ISNull(ProductTypeID,0) ProductTypeID 
			 from (    
				  SELECT  'Offer' as InquiryStatus,Count('Offer') as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(OfferDate) AS Year, datepart(qq,OfferDate) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by YEAR(OfferDate),datepart(qq,OfferDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus,ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
			 order by InquiryStatus
	 else if(@InquiryStatus = 'Order')	
			insert into #tempTable
			Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (    
				  SELECT  'Order' as InquiryStatus,Count('Order') as StatusCount,
							 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
							 YEAR(OrderDate) AS Year, datepart(qq,OrderDate) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OrderDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by YEAR(OrderDate),datepart(qq,OrderDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus, ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
			 order by InquiryStatus            
	       
	 else if(@InquiryStatus = 'Delivered')	
	 insert into #tempTable
			Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (    
				  SELECT  'Delivered' as InquiryStatus,Count('Delivered') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(ShipmentDate) AS Year, datepart(qq,ShipmentDate) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and ShipmentDate is not null and 
						 ShipmentDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							ShipmentDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID --and InquiryStatus = 'Delivered'
				   Group by YEAR(ShipmentDate),datepart(qq,ShipmentDate),ProductTypeID
				  ) as tbl
			-- where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus,ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
			 order by InquiryStatus  
	    else if(@InquiryStatus = 'GoodsPaid' )
	   insert into #tempTable	
			Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (    
				  SELECT  'GoodsPaid' as InquiryStatus,Count('GoodsPaid') as StatusCount,
							 ISNull(Sum(PaidAmountInEuro),0) as TotalAmount, 
							 YEAR(CompletedGoodsPaidON) AS Year, datepart(qq,CompletedGoodsPaidON) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedGoodsPaidON is not null and 
						 CompletedGoodsPaidON >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							CompletedGoodsPaidON <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID --and InquiryStatus = 'Delivered'
				   Group by YEAR(CompletedGoodsPaidON),datepart(qq,CompletedGoodsPaidON),ProductTypeID
				  ) as tbl
			-- where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus,ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
			 order by InquiryStatus  
	   else if(@InquiryStatus = 'Completed' )
	   insert into #tempTable	
			Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (    
				  SELECT  'Completed' as InquiryStatus,Count('Completed') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(CompletedOn) AS Year, datepart(qq,CompletedOn) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedOn is not null and 
						 CompletedOn >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							CompletedOn <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID --and InquiryStatus = 'Delivered'
				   Group by YEAR(CompletedOn),datepart(qq,CompletedOn),ProductTypeID
				  ) as tbl
			-- where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus,ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
			 order by InquiryStatus        
	   else 
	   insert into #tempTable
			Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (    
				  SELECT InquiryStatus,Count(InquiryStatus) as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(LostDate) AS Year, datepart(qq,LostDate) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID and InquiryStatus IN ('Lost','Regret','Cancelled','LateResponse')
				   Group by YEAR(LostDate),datepart(qq,LostDate),InquiryStatus,ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus,ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
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
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount,
							 0 as TotalAmount, 
							 YEAR(InquiryDate) AS Year
							 ,ISNull(ProductTypeID,0) ProductTypeID
						FROM  viewSubProjectTotals
					where BranchID = @BranchID and InquiryDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							InquiryDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by YEAR(InquiryDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,[Year]
			 order by InquiryStatus   
	else if(@InquiryStatus = 'Offer')
	insert into #tempTable	
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 [Year] as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Offer' as InquiryStatus,Count('Offer') as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(OfferDate) AS Year,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						 OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by YEAR(OfferDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,[Year]
			 order by InquiryStatus  
	 else if(@InquiryStatus = 'Order')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 [Year] as SelecetdDate ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Order' as InquiryStatus,Count('Order') as StatusCount,
							 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
							 YEAR(OrderDate) AS Year,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OrderDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by YEAR(OrderDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,[Year]
			 order by InquiryStatus                
	 else if(@InquiryStatus = 'Delivered')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 [Year] as SelecetdDate ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Delivered' as InquiryStatus,Count('Delivered') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(ShipmentDate) AS Year,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and ShipmentDate is not null and 
						  ShipmentDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							ShipmentDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by YEAR(ShipmentDate),ProductTypeID
				  ) as tbl
			-- where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,[Year]
			 order by InquiryStatus 
	 else if(@InquiryStatus = 'GoodsPaid')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 [Year] as SelecetdDate ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'GoodsPaid' as InquiryStatus,Count('GoodsPaid') as StatusCount,
							 ISNull(Sum(PaidAmountInEuro),0) as TotalAmount, 
							 YEAR(CompletedGoodsPaidON) AS Year,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedGoodsPaidON is not null and 
						  CompletedGoodsPaidON >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							CompletedGoodsPaidON <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by YEAR(CompletedGoodsPaidON),ProductTypeID
				  ) as tbl
			-- where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,[Year]
			 order by InquiryStatus 
	 else if(@InquiryStatus = 'Completed')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 [Year] as SelecetdDate ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Completed' as InquiryStatus,Count('Completed') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(CompletedOn) AS Year,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedOn is not null and 
						  CompletedOn >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							CompletedOn <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by YEAR(CompletedOn),ProductTypeID
				  ) as tbl
			-- where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,[Year]
			 order by InquiryStatus 
	 else 
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 [Year] as SelecetdDate ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  InquiryStatus,Count(InquiryStatus) as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(LostDate) AS Year,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID and InquiryStatus IN ('Lost','Regret','Cancelled','LateResponse')
				   Group by YEAR(LostDate),InquiryStatus,ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus, ProductTypeID,[Year]
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
			 Convert(nvarchar(5),[Year],100) as SelecetdDate ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount,
							 0 as TotalAmount, 
							 YEAR(InquiryDate) AS YEAR,
							 DATEPART(wk,InquiryDate) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
						FROM  viewSubProjectTotals
					where BranchID = @BranchID and InquiryDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  InquiryDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group BY DATEPART(wk,InquiryDate), YEAR(InquiryDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus   
	else if(@InquiryStatus = 'Offer')
	insert into #tempTable	
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Offer' as InquiryStatus,Count('Offer') as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(OfferDate) AS Year,
							 DATEPART(wk,OfferDate) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group BY DATEPART(wk,OfferDate), YEAR(OfferDate) ,ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
			 order by InquiryStatus  
	 else if(@InquiryStatus = 'Order')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Order' as InquiryStatus,Count('Order') as StatusCount,
							 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
							 YEAR(OrderDate) AS Year,
							 DATEPART(wk,OrderDate) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OrderDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by  DATEPART(wk,OrderDate),YEAR(OrderDate), ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
			 order by InquiryStatus                
	 else if(@InquiryStatus = 'Delivered')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Delivered' as InquiryStatus,Count('Delivered') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(ShipmentDate) AS Year,
							 DATEPART(wk,ShipmentDate) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and ShipmentDate is not null and 
						  ShipmentDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							ShipmentDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by DATEPART(wk,ShipmentDate),YEAR(ShipmentDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
			 order by InquiryStatus 
	 else if(@InquiryStatus = 'GoodsPaid')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'GoodsPaid' as InquiryStatus,Count('GoodsPaid') as StatusCount,
							 ISNull(Sum(PaidAmountInEuro),0) as TotalAmount, 
							 YEAR(CompletedGoodsPaidON) AS Year,
							 DATEPART(wk,CompletedGoodsPaidON) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedGoodsPaidON is not null and 
						  CompletedGoodsPaidON >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							CompletedGoodsPaidON <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by DATEPART(wk,CompletedGoodsPaidON),YEAR(CompletedGoodsPaidON),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
			 order by InquiryStatus
	 else if(@InquiryStatus = 'Completed')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Completed' as InquiryStatus,Count('Completed') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(CompletedOn) AS Year,
							 DATEPART(wk,CompletedOn) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedOn is not null and 
						  CompletedOn >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							CompletedOn <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID
				   Group by DATEPART(wk,CompletedOn),YEAR(CompletedOn),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
			 order by InquiryStatus
	 else 
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  InquiryStatus,Count(InquiryStatus) as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(LostDate) AS Year,
							 DATEPART(wk,LostDate) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' or HasSubSuppliers ='True') and 
						  SupplierID = @SupplierID and InquiryStatus IN ('Lost','Regret','Cancelled','LateResponse')
				   Group by DATEPART(wk,LostDate),YEAR(LostDate),InquiryStatus, ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus, ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
			 order by InquiryStatus 
	END
		PRINT('HI')
	--select * from #tempTable
END
ELSE
BEGIN
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
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount,
							 0 as TotalAmount, 
							 YEAR(InquiryDate) AS Year,Month(InquiryDate) AS Month,
							 ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and InquiryDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  InquiryDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(InquiryDate),Month(InquiryDate), ProductTypeID
				  ) as tbl 
			 where InquiryStatus = @InquiryStatus    
			 Group by ProductTypeID,InquiryStatus,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus  
	  else if(@InquiryStatus = 'Offer')	
	  insert into #tempTable
			 Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  'Offer' as InquiryStatus,Count('Offer') as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(OfferDate) AS Year,Month(OfferDate) AS Month,
							 ISNull(ProductTypeID,0)  ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(OfferDate),Month(OfferDate),ProductTypeID
				  ) as tbl 
			 where InquiryStatus = @InquiryStatus    
			 Group by ProductTypeID,InquiryStatus,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus  
	   else if(@InquiryStatus = 'Order')
	   insert into #tempTable	
			 Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  'Order' as InquiryStatus,Count('Order') as StatusCount,
							 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
							 YEAR(OrderDate) AS Year,Month(OrderDate) AS Month,
							 ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OrderDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(OrderDate),Month(OrderDate),ProductTypeID
				  ) as tbl 
			 where InquiryStatus = @InquiryStatus    
			 Group by ProductTypeID,InquiryStatus,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus    
	   else if(@InquiryStatus = 'Delivered' )
	   insert into #tempTable	
			 Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  'Delivered' as InquiryStatus,Count('Delivered') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(ShipmentDate) AS Year,Month(ShipmentDate) AS Month
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and ShipmentDate is not null and 
						  ShipmentDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  ShipmentDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(ShipmentDate),Month(ShipmentDate), ProductTypeID
				  ) as tbl 
			-- where InquiryStatus = @InquiryStatus    
			 Group by InquiryStatus,ProductTypeID,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus
	      else if(@InquiryStatus = 'GoodsPaid' )
	   insert into #tempTable	
			 Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  'GoodsPaid' as InquiryStatus,Count('GoodsPaid') as StatusCount,
							 ISNull(Sum(PaidAmountInEuro),0) as TotalAmount, 
							 YEAR(CompletedGoodsPaidON) AS Year,Month(CompletedGoodsPaidON) AS Month
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedGoodsPaidON is not null and 
						  CompletedGoodsPaidON >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  CompletedGoodsPaidON <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(CompletedGoodsPaidON),Month(CompletedGoodsPaidON), ProductTypeID
				  ) as tbl 
			-- where InquiryStatus = @InquiryStatus    
			 Group by InquiryStatus,ProductTypeID,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus
	      else if(@InquiryStatus = 'Completed' )
	   insert into #tempTable	
			 Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  'Completed' as InquiryStatus,Count('Completed') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(CompletedOn) AS Year,Month(CompletedOn) AS Month
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedOn is not null and 
						  CompletedOn >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  CompletedOn <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(CompletedOn),Month(CompletedOn), ProductTypeID
				  ) as tbl 
			-- where InquiryStatus = @InquiryStatus    
			 Group by InquiryStatus,ProductTypeID,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus
	   else 
	   insert into #tempTable
		   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from ( SELECT  InquiryStatus,Count(InquiryStatus) as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(LostDate) AS Year,Month(LostDate) AS Month
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  InquiryStatus IN ('Lost','Regret','Cancelled','LateResponse') and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(LostDate),Month(LostDate),InquiryStatus,ProductTypeID
				  ) as tbl 
			 where InquiryStatus = @InquiryStatus    
			 Group by InquiryStatus,ProductTypeID,Convert(nvarchar(5),[Month],100) + '-' + Convert(nvarchar(5),[Year],100)
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
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (    
				  SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount,
							 0 as TotalAmount, 
							 YEAR(InquiryDate) AS Year, datepart(qq,InquiryDate) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and InquiryDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  InquiryDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(InquiryDate),datepart(qq,InquiryDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus,ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
			 order by InquiryStatus  
		else if(@InquiryStatus = 'Offer')
		insert into #tempTable	
			Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate
			 ,ISNull(ProductTypeID,0) ProductTypeID 
			 from (    
				  SELECT  'Offer' as InquiryStatus,Count('Offer') as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(OfferDate) AS Year, datepart(qq,OfferDate) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(OfferDate),datepart(qq,OfferDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus,ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
			 order by InquiryStatus
	 else if(@InquiryStatus = 'Order')	
			insert into #tempTable
			Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (    
				  SELECT  'Order' as InquiryStatus,Count('Order') as StatusCount,
							 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
							 YEAR(OrderDate) AS Year, datepart(qq,OrderDate) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OrderDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(OrderDate),datepart(qq,OrderDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus, ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
			 order by InquiryStatus            
	       
	 else if(@InquiryStatus = 'Delivered')	
	 insert into #tempTable
			Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (    
				  SELECT  'Delivered' as InquiryStatus,Count('Delivered') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(ShipmentDate) AS Year, datepart(qq,ShipmentDate) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and ShipmentDate is not null and 
						 ShipmentDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							ShipmentDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(ShipmentDate),datepart(qq,ShipmentDate),ProductTypeID
				  ) as tbl
			-- where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus,ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
			 order by InquiryStatus 
	    else if(@InquiryStatus = 'GoodsPaid')	
	 insert into #tempTable
			Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (    
				  SELECT  'GoodsPaid' as InquiryStatus,Count('GoodsPaid') as StatusCount,
							 ISNull(Sum(PaidAmountInEuro),0) as TotalAmount, 
							 YEAR(CompletedGoodsPaidON) AS Year, datepart(qq,CompletedGoodsPaidON) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedGoodsPaidON is not null and 
						 CompletedGoodsPaidON >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							CompletedGoodsPaidON <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(CompletedGoodsPaidON),datepart(qq,CompletedGoodsPaidON),ProductTypeID
				  ) as tbl
			-- where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus,ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
			 order by InquiryStatus 
		 else if(@InquiryStatus = 'Completed')	
	 insert into #tempTable
			Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (    
				  SELECT  'Completed' as InquiryStatus,Count('Completed') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(CompletedOn) AS Year, datepart(qq,CompletedOn) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedOn is not null and 
						 CompletedOn >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							CompletedOn <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(CompletedOn),datepart(qq,CompletedOn),ProductTypeID
				  ) as tbl
			-- where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus,ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
			 order by InquiryStatus              
	   else 
	   insert into #tempTable
			Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100) as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (    
				  SELECT InquiryStatus,Count(InquiryStatus) as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(LostDate) AS Year, datepart(qq,LostDate) AS Quarter
							 ,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						   InquiryStatus IN ('Lost','Regret','Cancelled','LateResponse') and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(LostDate),datepart(qq,LostDate),InquiryStatus,ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus 
			 Group by InquiryStatus,ProductTypeID,'Q.' + Convert(nvarchar(5),[Quarter],100) + ' - ' + Convert(nvarchar(5),Year,100)
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
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount,
							 0 as TotalAmount, 
							 YEAR(InquiryDate) AS Year
							 ,ISNull(ProductTypeID,0) ProductTypeID
						FROM  viewSubProjectTotals
					where BranchID = @BranchID and InquiryDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							InquiryDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
				   Group by YEAR(InquiryDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,[Year]
			 order by InquiryStatus   
	else if(@InquiryStatus = 'Offer')
	insert into #tempTable	
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 [Year] as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Offer' as InquiryStatus,Count('Offer') as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(OfferDate) AS Year,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						 OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(OfferDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,[Year]
			 order by InquiryStatus  
	 else if(@InquiryStatus = 'Order')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 [Year] as SelecetdDate ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Order' as InquiryStatus,Count('Order') as StatusCount,
							 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
							 YEAR(OrderDate) AS Year,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OrderDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(OrderDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,[Year]
			 order by InquiryStatus                
	 else if(@InquiryStatus = 'Delivered')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 [Year] as SelecetdDate ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Delivered' as InquiryStatus,Count('Delivered') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(ShipmentDate) AS Year,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and ShipmentDate is not null and 
						  ShipmentDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							ShipmentDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True') 
				   Group by YEAR(ShipmentDate),ProductTypeID
				  ) as tbl
			-- where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,[Year]
			 order by InquiryStatus 
	 else if(@InquiryStatus = 'GoodsPaid')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 [Year] as SelecetdDate ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'GoodsPaid' as InquiryStatus,Count('GoodsPaid') as StatusCount,
							 ISNull(Sum(PaidAmountInEuro),0) as TotalAmount, 
							 YEAR(CompletedGoodsPaidON) AS Year,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedGoodsPaidON is not null and 
						  CompletedGoodsPaidON >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							CompletedGoodsPaidON <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(CompletedGoodsPaidON),ProductTypeID
				  ) as tbl
			-- where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,[Year]
			 order by InquiryStatus 
	 else if(@InquiryStatus = 'Completed')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 [Year] as SelecetdDate ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Completed' as InquiryStatus,Count('Completed') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(CompletedOn) AS Year,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedOn is not null and 
						  CompletedOn >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							CompletedOn <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(CompletedOn),ProductTypeID
				  ) as tbl
			-- where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,[Year]
			 order by InquiryStatus 
	 else 
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 [Year] as SelecetdDate ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  InquiryStatus,Count(InquiryStatus) as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(LostDate) AS Year,ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and  LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  InquiryStatus IN ('Lost','Regret','Cancelled','LateResponse') and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by YEAR(LostDate),InquiryStatus,ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus, ProductTypeID,[Year]
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
			 Convert(nvarchar(5),[Year],100) as SelecetdDate ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Inquiry' as InquiryStatus,Count('Inquiry') as StatusCount,
							 0 as TotalAmount, 
							 YEAR(InquiryDate) AS YEAR,
							 DATEPART(wk,InquiryDate) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
						FROM  viewSubProjectTotals
					where BranchID = @BranchID and InquiryDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  InquiryDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group BY DATEPART(wk,InquiryDate), YEAR(InquiryDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)
			 order by InquiryStatus   
	else if(@InquiryStatus = 'Offer')
	insert into #tempTable	
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Offer' as InquiryStatus,Count('Offer') as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(OfferDate) AS Year,
							 DATEPART(wk,OfferDate) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group BY DATEPART(wk,OfferDate), YEAR(OfferDate) ,ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
			 order by InquiryStatus  
	 else if(@InquiryStatus = 'Order')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Order' as InquiryStatus,Count('Order') as StatusCount,
							 ISNull(Sum(PriceInEuro),0) as TotalAmount, 
							 YEAR(OrderDate) AS Year,
							 DATEPART(wk,OrderDate) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and OrderDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by  DATEPART(wk,OrderDate),YEAR(OrderDate), ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
			 order by InquiryStatus                
	 else if(@InquiryStatus = 'Delivered')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Delivered' as InquiryStatus,Count('Delivered') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(ShipmentDate) AS Year,
							 DATEPART(wk,ShipmentDate) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and ShipmentDate is not null and 
						  ShipmentDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							ShipmentDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by DATEPART(wk,ShipmentDate),YEAR(ShipmentDate),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
			 order by InquiryStatus
	 else if(@InquiryStatus = 'GoodsPaid')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'GoodsPaid' as InquiryStatus,Count('GoodsPaid') as StatusCount,
							 ISNull(Sum(PaidAmountInEuro),0) as TotalAmount, 
							 YEAR(CompletedGoodsPaidON) AS Year,
							 DATEPART(wk,CompletedGoodsPaidON) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedGoodsPaidON is not null and 
						  CompletedGoodsPaidON >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							CompletedGoodsPaidON <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True') 
				   Group by DATEPART(wk,CompletedGoodsPaidON),YEAR(CompletedGoodsPaidON),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
			 order by InquiryStatus 
	 else if(@InquiryStatus = 'Completed')	
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  'Completed' as InquiryStatus,Count('Completed') as StatusCount,
							 ISNull(Sum(ShipmentPriceInEuro),0) as TotalAmount, 
							 YEAR(CompletedOn) AS Year,
							 DATEPART(wk,CompletedOn) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and CompletedOn is not null and 
						  CompletedOn >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							CompletedOn <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))  and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by DATEPART(wk,CompletedOn),YEAR(CompletedOn),ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus,ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
			 order by InquiryStatus  
	 else 
	 insert into #tempTable
	   Select InquiryStatus,
			 ISNull(SUM(TotalAmount),0) as TotalAmount,
			 SUM(StatusCount) as StatusCount,
			 'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100)  as SelecetdDate 
			 ,ISNull(ProductTypeID,0) ProductTypeID
			 from (     SELECT  InquiryStatus,Count(InquiryStatus) as StatusCount,
							 ISNull(Sum(QuotationPriceInEuro),0) as TotalAmount, 
							 YEAR(LostDate) AS Year,
							 DATEPART(wk,LostDate) AS [Week],ISNull(ProductTypeID,0) ProductTypeID
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
							LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  InquiryStatus IN ('Lost','Regret','Cancelled','LateResponse') and 
						  (IsPrincipale = 'True' OR HasSubSuppliers='True')
				   Group by DATEPART(wk,LostDate),YEAR(LostDate),InquiryStatus, ProductTypeID
				  ) as tbl
			 where InquiryStatus = @InquiryStatus  
			 Group by InquiryStatus, ProductTypeID,'CW.' +Convert(nvarchar(5), [Week],100) + ' - ' +Convert(nvarchar(5),[Year],100) 
			 order by InquiryStatus 
	END
END

	select ISNull(InquiryStatus,@InquiryStatus) InquiryStatus, IsNull(TotalAmount,0) TotalAmount,
	IsNull(StatusCount,0) StatusCount , #AllDatesRange.DateRange as SelecetdDate ,IsNull(ProductTypeID,0) ProductTypeID from 
	#tempTable Right Outer join #AllDatesRange
	on #AllDatesRange.DateRange = #tempTable.SelecetdDate
	 
   
	--DROP TABLE [dbo].[#tempTable]	

	--DROP TABLE [dbo].[#AllDatesRange]
	
    print(@FromDate)
	print(@ToDate)   
END
