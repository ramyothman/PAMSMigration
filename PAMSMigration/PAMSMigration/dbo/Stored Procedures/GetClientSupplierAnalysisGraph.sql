-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClientSupplierAnalysisGraph]
		@PeriodNumber int,
		@PeriodChoice int,
		@Current bit,
		@InquiryStatus nvarchar(50),
		@ClientID int,
		@suppliers nvarchar(Max),
		@IsFromToChecked bit,
		@ChoosenFromDate datetime,
		@ChoosenToDate datetime,
        @ChoosenProductTypes nvarchar(255),
        @BranchID int
AS
BEGIN
declare @sql nvarchar(max)
declare @FromDate as datetime
declare @ToDate as datetime
set @FromDate = @ChoosenFromDate
set @ToDate = @ChoosenToDate
declare @Date nvarchar(50)
declare @Price nvarchar(100)
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
if(@InquiryStatus = 'Inquiry')
begin
	set @Date = 'InquiryDate'
	set @Price = 'QuotationPriceInEuro'
END
         
else if(@InquiryStatus = 'Offer')
begin
	set @Date = 'OfferDate'
	set @Price = 'QuotationPriceInEuro'
END
  
else if(@InquiryStatus = 'Order')
begin
	set @Date = 'OrderDate'
	set @Price = 'PriceInEuro'
END
 
else if(@InquiryStatus = 'Delivered')
begin
	set @Date = 'ShipmentDate'
	set @Price = 'ShipmentPriceInEuro'
END
 
else 
begin
	set @Date = 'LostDate'
	set @Price = 'QuotationPriceInEuro'
END
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
 if(@InquiryStatus ='Inquiry' or @InquiryStatus = 'Offer' or @InquiryStatus = 'Order'
    )
 set @sql =  'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''' +@InquiryStatus +''' InquiryStatus, YEAR(' + @Date + ') AS Year,
                 Month(' + @Date + ') AS Month, COUNT('''+ @InquiryStatus +''') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                             ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + @BranchID +' and ' + @Date + ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				        '+ @Date + ' <=  (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @suppliers +' and ' + @ChoosenProductTypes + '
				 GROUP BY  YEAR(' + @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				            Month(' + @Date + ')
	          ) as tbl
         where InquiryStatus = ''' + @InquiryStatus +''' and CustomerID =' +Convert(nvarchar(5), @ClientID,100) 
        + ' Group by InquiryStatus,SupplierName
         order by StatusCount  ,TotalAmount  asc'
 else if ( @InquiryStatus ='Delivered')
 set @sql =  'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''' +@InquiryStatus +''' InquiryStatus, YEAR(' + @Date + ') AS Year,
                 Month(' + @Date + ') AS Month, COUNT(InquiryNumber) AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                             ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + @BranchID +' and ' +  @Date + ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				         '+ @Date + ' <=  (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @suppliers +' and ' + @ChoosenProductTypes + '
				 GROUP BY  YEAR(' + @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				            Month(' + @Date + ')
	          ) as tbl
         where InquiryStatus = ''' + @InquiryStatus +''' and CustomerID =' +Convert(nvarchar(5), @ClientID,100) 
        + ' Group by InquiryStatus,SupplierName
         order by StatusCount  ,TotalAmount  asc'
  else
   set @sql =  'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName,
         SUM(StatusCount) as StatusCount
         from (  SELECT InquiryStatus, YEAR(' + @Date + ') AS Year,
                 Month(' + @Date + ') AS Month, COUNT('''+ @InquiryStatus +''') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                             ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + @BranchID +' and ' +  @Date + ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				        '+ @Date + ' <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @suppliers +' and ' + @ChoosenProductTypes + '
				 GROUP BY  YEAR(' + @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				            Month(' + @Date + ')
	          ) as tbl
         where InquiryStatus = ''' + @InquiryStatus +''' and CustomerID =' +Convert(nvarchar(5), @ClientID,100) 
        + ' Group by InquiryStatus,SupplierName
         order by StatusCount  ,TotalAmount  asc'
          
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
    if(@InquiryStatus ='Inquiry' or @InquiryStatus = 'Offer' or @InquiryStatus = 'Order'
    )
  set @sql =  'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName,
         SUM(StatusCount) as StatusCount
         from (  
         
          SELECT ''' +@InquiryStatus +''' InquiryStatus, YEAR(' + @Date + ') AS Year,
                 datepart(qq,' + @Date + ') AS Quarter, COUNT(''' +@InquiryStatus +''') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                              ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + @BranchID +' and ' +  @Date + ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100)+'''))) and 
				         '+ @Date + ' <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+Convert(nvarchar(12),@ToDate,100)+''')))' + @suppliers +' and ' + @ChoosenProductTypes  +
				 'GROUP BY  YEAR(' + @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				           datepart(qq,' + @Date + ')
	          ) as tbl
         where InquiryStatus = '''+  @InquiryStatus +''' and CustomerID = ' +Convert(nvarchar(5), @ClientID,100) 
         +' Group by InquiryStatus,SupplierName
         order by StatusCount ,TotalAmount  asc'  
 else if ( @InquiryStatus ='Delivered') 
  set @sql =  'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName,
         SUM(StatusCount) as StatusCount
         from (  
         
          SELECT ''' +@InquiryStatus +''' InquiryStatus, YEAR(' + @Date + ') AS Year,
                 datepart(qq,' + @Date + ') AS Quarter, COUNT(InquiryNumber) AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                              ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + @BranchID +' and ' +  @Date + ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100)+'''))) and 
				          '+ @Date + ' <=  (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+Convert(nvarchar(12),@ToDate,100)+''')))' + @suppliers +' and ' + @ChoosenProductTypes  +
				 'GROUP BY  YEAR(' + @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				           datepart(qq,' + @Date + ')
	          ) as tbl
         where InquiryStatus = '''+  @InquiryStatus +''' and CustomerID = ' +Convert(nvarchar(5), @ClientID,100) 
         +' Group by InquiryStatus,SupplierName
         order by StatusCount ,TotalAmount  asc'  
      else 
         set @sql =  'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName,
         SUM(StatusCount) as StatusCount
         from (  
         
          SELECT InquiryStatus, YEAR(' + @Date + ') AS Year,
                 datepart(qq,' + @Date + ') AS Quarter, COUNT(''' +@InquiryStatus +''') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                              ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + @BranchID +' and ' +  @Date + ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100)+'''))) and 
				        '+ @Date + ' <=  (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+Convert(nvarchar(12),@ToDate,100)+''')))' + @suppliers+' and ' + @ChoosenProductTypes  +
				 'GROUP BY  YEAR(' + @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				           datepart(qq,' + @Date + ')
	          ) as tbl
         where InquiryStatus = '''+  @InquiryStatus +''' and CustomerID = ' +Convert(nvarchar(5), @ClientID,100) 
         +' Group by InquiryStatus,SupplierName
         order by StatusCount ,TotalAmount  asc'      
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
      if(@InquiryStatus ='Inquiry' or @InquiryStatus = 'Offer' or @InquiryStatus = 'Order'
    )
    set @sql = 'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName,
         SUM(StatusCount) as StatusCount
         from (  
         
          SELECT ''' + @InquiryStatus + ''' InquiryStatus, YEAR('+ @Date + ') AS Year,
                 COUNT('''+@InquiryStatus +''') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                              ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + @BranchID +' and ' + @Date+ ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, ''' + Convert(nvarchar(12),@FromDate,100)+'''))) and 
				        '+ @Date + ' <=  (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+Convert(nvarchar(12),@ToDate,100)+''')))' + @suppliers+' and ' + @ChoosenProductTypes 
				+' GROUP BY  YEAR('+ @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName
	          ) as tbl
         where InquiryStatus = '''+@InquiryStatus+'''  and CustomerID = '+ Convert(nvarchar(5),@ClientID,100)
         +' Group by InquiryStatus,SupplierName
         order by StatusCount ,TotalAmount  asc'    
   else if ( @InquiryStatus ='Delivered')
set @sql = 'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName,
         SUM(StatusCount) as StatusCount
         from (  
         
          SELECT ''' + @InquiryStatus + ''' InquiryStatus, YEAR('+ @Date + ') AS Year,
                 COUNT(InquiryNumber) AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                              ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + @BranchID +' and ' +  @Date+ ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, ''' + Convert(nvarchar(12),@FromDate,100)+'''))) and 
				        '+ @Date + ' <=  (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+Convert(nvarchar(12),@ToDate,100)+''')))' + @suppliers+' and ' + @ChoosenProductTypes 
				+' GROUP BY  YEAR('+ @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName
	          ) as tbl
         where InquiryStatus = '''+@InquiryStatus+'''  and CustomerID = '+ Convert(nvarchar(5),@ClientID,100)
         +' Group by InquiryStatus,SupplierName
         order by StatusCount ,TotalAmount  asc'   
  else
     set @sql = 'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName,
         SUM(StatusCount) as StatusCount
         from (  
         
          SELECT  InquiryStatus, YEAR('+ @Date + ') AS Year,
                 COUNT('''+@InquiryStatus +''') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                              ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + @BranchID +' and ' + @Date+ ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, ''' + Convert(nvarchar(12),@FromDate,100)+'''))) and 
				      '+ @Date + ' <=  (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+Convert(nvarchar(12),@ToDate,100)+''')))' + @suppliers+' and ' + @ChoosenProductTypes 
				+' GROUP BY  YEAR('+ @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName
	          ) as tbl
         where InquiryStatus = '''+@InquiryStatus+'''  and CustomerID = '+ Convert(nvarchar(5),@ClientID,100)
         +' Group by InquiryStatus,SupplierName
         order by StatusCount ,TotalAmount  asc'
     
END
    print(@sql)
    EXECUTE sp_executesql @sql
    print(@FromDate)
	print(@ToDate)   
END
