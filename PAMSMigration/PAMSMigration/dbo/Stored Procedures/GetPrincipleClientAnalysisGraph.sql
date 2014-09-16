-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPrincipleClientAnalysisGraph]
		@PeriodNumber int,
		@PeriodChoice int,
		@Current bit,
		@InquiryStatus nvarchar(50),
		@SupplierID int,
		@customers nvarchar(Max),
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
else if(@InquiryStatus = 'GoodsPaid')
begin
	set @Date = 'CompletedGoodsPaidON'
	set @Price = 'PaidAmountInEuro'
END
else if(@InquiryStatus = 'Completed')
begin
	set @Date = 'CompletedOn'
	set @Price = 'PriceInEuro'
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
 or @InquiryStatus = 'GoodsPaid' or @InquiryStatus = 'Completed')
 set @sql =  'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''' +@InquiryStatus +''' InquiryStatus, YEAR(' + @Date + ') AS Year,
                 Month(' + @Date + ') AS Month, COUNT('''+ @InquiryStatus +''') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM       dbo.viewSubProjectTotals
				 where BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and ' + @Date + ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				       '+ @Date + ' <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' + @ChoosenProductTypes + '
				 GROUP BY  YEAR(' + @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(' + @Date + ')
	          ) as tbl
         where InquiryStatus = ''' + @InquiryStatus +''' and SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode 
         order by StatusCount  ,TotalAmount  asc'
else if (@InquiryStatus ='Delivered')
set @sql =  'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''' +@InquiryStatus +''' InquiryStatus, YEAR(' + @Date + ') AS Year,
                 Month(' + @Date + ') AS Month, COUNT(InquiryNumber) AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM       dbo.viewSubProjectTotals
				 where  BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and ' +  @Date + ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				         '+ @Date + ' <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' + @ChoosenProductTypes + '
				 GROUP BY  YEAR(' + @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(' + @Date + ')
	          ) as tbl
         where SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode 
         order by StatusCount  ,TotalAmount  asc'
else         
set @sql =  'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT InquiryStatus, YEAR(' + @Date + ') AS Year,
                 Month(' + @Date + ') AS Month, COUNT('''+ @InquiryStatus +''') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM       dbo.viewSubProjectTotals
				 where  BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and ' +  @Date + ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				       '+ @Date + ' <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' + @ChoosenProductTypes + '
				 GROUP BY  YEAR(' + @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(' + @Date + ')
	          ) as tbl
         where InquiryStatus = ''' + @InquiryStatus +''' and SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode 
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
    or @InquiryStatus = 'GoodsPaid' or @InquiryStatus = 'Completed')
  set @sql =  'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  
         
          SELECT ''' +@InquiryStatus +''' InquiryStatus, YEAR(' + @Date + ') AS Year,
                 datepart(qq,' + @Date + ') AS Quarter, COUNT(''' +@InquiryStatus +''') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                              ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM       dbo.viewSubProjectTotals
				 where  BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and ' +  @Date + ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100)+'''))) and 
				         '+ @Date + ' <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+Convert(nvarchar(12),@ToDate,100)+''')))' + @customers +
				 'GROUP BY  YEAR(' + @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				           datepart(qq,' + @Date + ')
	          ) as tbl
         where InquiryStatus = '''+  @InquiryStatus +''' and SupplierID = ' +Convert(nvarchar(5), @SupplierID,100) 
         +' Group by InquiryStatus,CompanyName,CompanyCode 
         order by StatusCount ,TotalAmount  asc'   
 else if (@InquiryStatus ='Delivered')
set @sql = 'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  
         
          SELECT ''' +@InquiryStatus +''' InquiryStatus, YEAR(' + @Date + ') AS Year,
                 datepart(qq,' + @Date + ') AS Quarter, COUNT(InquiryNumber) AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                              ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM       dbo.viewSubProjectTotals
				 where  BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and ' +  @Date + ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100)+'''))) and 
				        '+ @Date + ' <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+Convert(nvarchar(12),@ToDate,100)+''')))' + @customers +
				 'GROUP BY  YEAR(' + @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				           datepart(qq,' + @Date + ')
	          ) as tbl
         where SupplierID = ' +Convert(nvarchar(5), @SupplierID,100) 
         +' Group by InquiryStatus,CompanyName,CompanyCode 
         order by StatusCount ,TotalAmount  asc'   
 else 
 set @sql =  'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (          
          SELECT  InquiryStatus, YEAR(' + @Date + ') AS Year,
                 datepart(qq,' + @Date + ') AS Quarter, COUNT(''' +@InquiryStatus +''') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                              ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM       dbo.viewSubProjectTotals
				 where BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and ' +  @Date + ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100)+'''))) and 
				        '+ @Date + ' <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+Convert(nvarchar(12),@ToDate,100)+''')))' + @customers +
				 'GROUP BY  YEAR(' + @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				           datepart(qq,' + @Date + ')
	          ) as tbl
         where InquiryStatus = '''+  @InquiryStatus +''' and SupplierID = ' +Convert(nvarchar(5), @SupplierID,100) 
         +' Group by InquiryStatus,CompanyName,CompanyCode 
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
    or @InquiryStatus = 'GoodsPaid' or @InquiryStatus = 'Completed')
    set @sql = 'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  
         
          SELECT ''' + @InquiryStatus + ''' InquiryStatus, YEAR('+ @Date + ') AS Year,
                 COUNT('''+@InquiryStatus +''') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                              ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM       dbo.viewSubProjectTotals
				 where  BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and ' +  @Date+ ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, ''' + Convert(nvarchar(12),@FromDate,100)+'''))) and 
				         '+ @Date + ' <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+Convert(nvarchar(12),@ToDate,100)+''')))' + @customers
				+' GROUP BY  YEAR('+ @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName
	          ) as tbl
         where InquiryStatus = '''+@InquiryStatus+'''  and SupplierID = '+ Convert(nvarchar(5),@SupplierID,100)
         +' Group by InquiryStatus,CompanyName,CompanyCode 
         order by StatusCount ,TotalAmount  asc'  
 else if (@InquiryStatus ='Delivered')
 set @sql = 'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  
         
          SELECT ''' + @InquiryStatus + ''' InquiryStatus, YEAR('+ @Date + ') AS Year,
                 COUNT(InquiryNumber) AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                              ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM       dbo.viewSubProjectTotals
				 where  BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and ' +  @Date+ ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, ''' + Convert(nvarchar(12),@FromDate,100)+'''))) and 
				        '+ @Date + ' <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+Convert(nvarchar(12),@ToDate,100)+''')))' + @customers
				+' GROUP BY  YEAR('+ @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName
	          ) as tbl
         where SupplierID = '+ Convert(nvarchar(5),@SupplierID,100)
         +' Group by InquiryStatus,CompanyName,CompanyCode 
         order by StatusCount ,TotalAmount  asc'
 
 else
 
 set @sql = 'Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (           
          SELECT InquiryStatus, YEAR('+ @Date + ') AS Year,
                 COUNT('''+@InquiryStatus +''') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                              ISNull(Sum('+@Price +'),0) AS  TotalAmount
				 FROM       dbo.viewSubProjectTotals
				 where  BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and ' +  @Date+ ' >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, ''' + Convert(nvarchar(12),@FromDate,100)+'''))) and 
				        '+ @Date + ' <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+Convert(nvarchar(12),@ToDate,100)+''')))' + @customers
				+' GROUP BY  YEAR('+ @Date + '), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName
	          ) as tbl
         where InquiryStatus = '''+@InquiryStatus+'''  and SupplierID = '+ Convert(nvarchar(5),@SupplierID,100)
         +' Group by InquiryStatus,CompanyName,CompanyCode 
         order by StatusCount ,TotalAmount  asc'    
  
     
END
    print(@sql)
    EXECUTE sp_executesql @sql
    print(@FromDate)
	print(@ToDate)   
END
