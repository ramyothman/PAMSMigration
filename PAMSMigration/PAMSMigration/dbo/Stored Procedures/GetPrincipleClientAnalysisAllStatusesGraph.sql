-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPrincipleClientAnalysisAllStatusesGraph]
		@PeriodNumber int,
		@PeriodChoice int,
		@Current bit,
		@InquiryStatus nvarchar(500),
		@SupplierID int,
		@customers nvarchar(Max),
		@IsFromToChecked bit,
		@ChoosenFromDate datetime,
		@ChoosenToDate datetime,
        @ChoosenProductTypes nvarchar(255),
        @BranchID int 
AS
BEGIN
declare @sql1 nvarchar(max)
declare @sql2 nvarchar(max)
set @sql2 = ''
declare @sql3 nvarchar(max)
set @sql3 = ''
declare @sql4 nvarchar(max)
set @sql4 = ''
declare @sql5 nvarchar(max)
set @sql5 = ''
declare @sql6 nvarchar(max)
set @sql6 = ''
declare @sql7 nvarchar(max)
set @sql7 = ''
declare @sql8 nvarchar(max)
set @sql8 = ''
declare @sql9 nvarchar(max)
set @sql9 = ''
declare @sql10 nvarchar(max)
set @sql10 = ''
declare @FromDate as datetime
declare @ToDate as datetime
declare @index as int
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
set @ToDate = DATEADD(day,1, @ToDate)
select @index = charindex('Inquiry',@InquiryStatus)
if(@index <> 0)    
  set @sql1 =  '(Select InquiryStatus,
         0 as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''Inquiry'' InquiryStatus, YEAR(InquiryDate) AS Year,
                 Month(InquiryDate) AS Month, COUNT(''Inquiry'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum(QuotationPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and InquiryDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				       InquiryDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' +  @ChoosenProductTypes + '
				 GROUP BY  YEAR(InquiryDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(InquiryDate)
	          ) as tbl
         where InquiryStatus = ''Inquiry'' and SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode)'
        
 select @index = charindex('Offer',@InquiryStatus)
 if(@index <>0)    
 begin  
 if (len(@sql1) >0)
    set @sql2 = ' union'
  set @sql2 = @sql2 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''Offer'' InquiryStatus, YEAR(OfferDate) AS Year,
                 Month(OfferDate) AS Month, COUNT(''Offer'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum(QuotationPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and  OfferDate is not null and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				                        OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' +  @ChoosenProductTypes + '
				 GROUP BY  YEAR(OfferDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(OfferDate)
	          ) as tbl
         where InquiryStatus = ''Offer'' and SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode)'
         
 end
 select @index = charindex('Order',@InquiryStatus)
 
 if(@index <>0)    
  begin
  if (len(@sql2) >0 or len(@sql1) >0)
    set @sql3 = ' union'
  set @sql3 = @sql3 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''Order'' InquiryStatus, YEAR(OrderDate) AS Year,
                 Month(OrderDate) AS Month, COUNT(''Order'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum(PriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and  OrderDate is not null and OrderDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				                         OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' +  @ChoosenProductTypes + '
				 GROUP BY  YEAR(OrderDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(OrderDate)
	          ) as tbl
         where InquiryStatus = ''Order'' and SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode)'
 END
select @index = charindex('Delivered',@InquiryStatus)
 if(@index <>0)    
 begin
  if (len(@sql3) >0 or len(@sql2) >0 or len(@sql1) >0)
    set @sql4 =' union'
  set @sql4 = @sql4 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''Delivered'' InquiryStatus, YEAR(ShipmentDate) AS Year,
                 Month(ShipmentDate) AS Month, COUNT(InquiryNumber) AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum(ShipmentPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and  ShipmentDate is not null and ShipmentDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				                         ShipmentDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' +  @ChoosenProductTypes + '
				 GROUP BY  YEAR(ShipmentDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(ShipmentDate)
	          ) as tbl
         where InquiryStatus = ''Delivered'' and SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode)'               
    END    
     select @index = charindex('GoodsPaid',@InquiryStatus)
 if(@index <>0)    
 begin
  if (len(@sql3) >0 or len(@sql2) >0 or len(@sql1) >0 or len(@sql4) >0)
    set @sql10 =' union'
  set @sql10 = @sql10 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''GoodsPaid'' InquiryStatus, YEAR(CompletedGoodsPaidON) AS Year,
                 Month(CompletedGoodsPaidON) AS Month, COUNT(InquiryNumber) AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum(PaidAmountInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and  CompletedGoodsPaidON is not null and CompletedGoodsPaidON >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				                         CompletedGoodsPaidON <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' +  @ChoosenProductTypes + '
				 GROUP BY  YEAR(CompletedGoodsPaidON), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(CompletedGoodsPaidON)
	          ) as tbl
         where InquiryStatus = ''GoodsPaid'' and SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode)'               
    END   
     select @index = charindex('Completed',@InquiryStatus)
 if(@index <>0)    
 begin
  if (len(@sql10) >0 or len(@sql3) >0 or len(@sql2) >0 or len(@sql4) >0 or len(@sql1) >0)
    set @sql9 =' union'
  set @sql9 = @sql9 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''Completed'' InquiryStatus, YEAR(CompletedOn) AS Year,
                 Month(CompletedGoodsPaidON) AS Month, COUNT(InquiryNumber) AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum(PriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and  CompletedOn is not null and CompletedOn >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				                         CompletedOn <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' +  @ChoosenProductTypes + '
				 GROUP BY  YEAR(CompletedOn), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(CompletedGoodsPaidON)
	          ) as tbl
         where InquiryStatus = ''Completed'' and SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode)'               
    END     
select @index = charindex('Lost',@InquiryStatus) 
if(@index <>0)  
  begin
  if (len(@sql4) >0 or len(@sql3) >0 or len(@sql2) >0 or len(@sql1) >0 or len(@sql9) >0 or len(@sql10) >0)
    set @sql5 =  'union'
  set @sql5 = @sql5 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT InquiryStatus, YEAR(LostDate) AS Year,
                 Month(LostDate) AS Month, COUNT(''Lost'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum(QuotationPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and  LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				       LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' +  @ChoosenProductTypes + '
				 GROUP BY  YEAR(LostDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(LostDate)
	          ) as tbl
         where InquiryStatus = ''Lost'' and SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode)' 
         END 
select @index = charindex('LateResponse',@InquiryStatus) 
if(@index <>0)  
  begin
  if (len(@sql5) >0 or len(@sql4) >0 or len(@sql3) >0 or len(@sql2) >0 or len(@sql1) >0 or len(@sql9) >0 or len(@sql10) >0)
    set @sql6 = ' union'
 set @sql6 = @sql6 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT InquiryStatus, YEAR(LostDate) AS Year,
                 Month(LostDate) AS Month, COUNT(''LateResponse'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum(QuotationPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and  LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				       LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' +  @ChoosenProductTypes + '
				 GROUP BY  YEAR(LostDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(LostDate)
	          ) as tbl
         where InquiryStatus = ''LateResponse'' and SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode)' 
         END 
 select @index = charindex('Regret',@InquiryStatus) 
if(@index <>0)  
  begin
  if (len(@sql6) >0 or len(@sql5) >0 or len(@sql4) >0 or len(@sql3) >0 or len(@sql2) >0 or len(@sql1) >0 or len(@sql9) >0 or len(@sql10) >0)
    set @sql7 = ' union'
 set @sql7 = @sql7 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT InquiryStatus, YEAR(LostDate) AS Year,
                 Month(LostDate) AS Month, COUNT(''Regret'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum(QuotationPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				       LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' +  @ChoosenProductTypes + '
				 GROUP BY  YEAR(LostDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(LostDate)
	          ) as tbl
         where InquiryStatus = ''Regret'' and SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode)'
         END   
select @index = charindex('Cancelled',@InquiryStatus) 
if(@index <>0)  
  begin
  if (len(@sql7) >0 or len(@sql6) >0 or len(@sql5) >0 or len(@sql4) >0 or len(@sql3) >0 or len(@sql2) >0 or len(@sql1) >0 or len(@sql9) >0 or len(@sql10) >0)
    set @sql8 =  ' union'
 set @sql8 = @sql8 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,CompanyName,CompanyCode,
         SUM(StatusCount) as StatusCount
         from (  SELECT  InquiryStatus, YEAR(LostDate) AS Year,
                 Month(LostDate) AS Month, COUNT(''Cancelled'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName,CompanyCode, 
                             ISNull(Sum(QuotationPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 where  BranchID = ' + Convert(nvarchar(5),@BranchID,100) + ' and LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ Convert(nvarchar(12),@FromDate,100) +'''))) and 
				       LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, '''+ Convert(nvarchar(12),@ToDate,100) +''')))' + @customers +' and ' +  @ChoosenProductTypes + '
				 GROUP BY  YEAR(LostDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName,CompanyCode, 
				            Month(LostDate)
	          ) as tbl
         where InquiryStatus = ''Cancelled'' and SupplierID =' +Convert(nvarchar(5), @SupplierID,100) 
        + ' Group by InquiryStatus,CompanyName,CompanyCode)'
END 
 
    print(@FromDate)
	print(@ToDate) 
	
    --print(@sql1) 
    --print(@sql2)
    --print(@sql3)
    --print(@sql4)
    --print(@sql5)
    --print(@sql6)
    --print(@sql7)
    --print(@sql8)
     EXECUTE (N'' + @sql1 + @sql2+ @sql3+ @sql4+ @sql9 + @sql10 + @sql5+ @sql6+ @sql7+ @sql8+ '')
END
