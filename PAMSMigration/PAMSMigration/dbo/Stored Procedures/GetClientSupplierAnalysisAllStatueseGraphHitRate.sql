﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClientSupplierAnalysisAllStatueseGraphHitRate]	
		@InquiryStatus nvarchar(500),
		@ClientID int,
		@suppliers nvarchar(Max),
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
declare @index as int
 declare @tempSuppliers nvarchar(max)
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
IF(LEN(@suppliers) >0)
SET @suppliers = 'and ' + @suppliers
set @ChoosenProductTypes = 'Where '+@ChoosenProductTypes
select @index = charindex('Inquiry',@InquiryStatus)
if(@index <> 0)    
  set @sql1 =  '(Select InquiryStatus,
         0 as TotalAmount,SupplierName as Name,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''Inquiry'' InquiryStatus, YEAR(InquiryDate) AS Year,
                 Month(InquiryDate) AS Month, COUNT(''Inquiry'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                             ISNull(Sum(QuotationPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				' +  @ChoosenProductTypes + @suppliers  + ' and BranchID = ' + @BranchID +' 
				 GROUP BY  YEAR(InquiryDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				            Month(InquiryDate)
	          ) as tbl
         where InquiryStatus = ''Inquiry'' and CustomerID =' +Convert(nvarchar(5), @ClientID,100) 
        + ' Group by InquiryStatus,SupplierName)'
        
 select @index = charindex('Offer',@InquiryStatus)
 if(@index <>0)    
 begin  
 --if(len(@suppliers) > 0)
    set @tempSuppliers = @suppliers + ' and OfferDate is not null'
    --else 
    --set @tempSuppliers = ' where OfferDate is not null'
    
 if (len(@sql1) >0)
    set @sql2 = ' union'
  set @sql2 = @sql2 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName as Name,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''Offer'' InquiryStatus, YEAR(OfferDate) AS Year,
                 Month(OfferDate) AS Month, COUNT(''Offer'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                             ISNull(Sum(QuotationPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 ' + @ChoosenProductTypes + @tempSuppliers + + ' and BranchID = ' + @BranchID +' 
				 GROUP BY  YEAR(OfferDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				            Month(OfferDate)
	          ) as tbl
         where InquiryStatus = ''Offer'' and CustomerID =' +Convert(nvarchar(5), @ClientID,100) 
        + ' Group by InquiryStatus,SupplierName)'
         
 end
 select @index = charindex('Order',@InquiryStatus)
 
 if(@index <>0)    
  begin
   --if(len(@suppliers) > 0)
    set @tempSuppliers = @suppliers + ' and OrderDate is not null'
    --else 
    --set @tempSuppliers = ' where OrderDate is not null'
    
  if (len(@sql2) >0 or len(@sql1) >0)
    set @sql3 = ' union'
  set @sql3 = @sql3 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName as Name,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''Order'' InquiryStatus, YEAR(OrderDate) AS Year,
                 Month(OrderDate) AS Month, COUNT(''Order'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                             ISNull(Sum(PriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 ' + @ChoosenProductTypes + @tempSuppliers + + ' and BranchID = ' + @BranchID +' 
				 GROUP BY  YEAR(OrderDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				            Month(OrderDate)
	          ) as tbl
         where InquiryStatus = ''Order'' and CustomerID =' +Convert(nvarchar(5), @ClientID,100) 
        + ' Group by InquiryStatus,SupplierName)'
 END
select @index = charindex('Delivered',@InquiryStatus)
 if(@index <>0)    
 begin
 --if(len(@suppliers) > 0)
    set @tempSuppliers = @suppliers + ' and ShipmentDate is not null and InquiryStatus = ''Delivered'''
    --else 
    --set @tempSuppliers = ' where ShipmentDate is not null and InquiryStatus = ''Delivered'''
    
  if (len(@sql3) >0 or len(@sql2) >0 or len(@sql1) >0)
    set @sql4 =' union'
  set @sql4 = @sql4 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName as Name,
         SUM(StatusCount) as StatusCount
         from (  SELECT ''Delivered'' InquiryStatus, YEAR(ShipmentDate) AS Year,
                 Month(ShipmentDate) AS Month, COUNT(InquiryNumber) AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                             ISNull(Sum(ShipmentPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				 ' + @ChoosenProductTypes + @tempSuppliers + + ' and BranchID = ' + @BranchID +' 
				 GROUP BY  YEAR(ShipmentDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				            Month(ShipmentDate)
	          ) as tbl
         where InquiryStatus = ''Delivered'' and CustomerID =' +Convert(nvarchar(5), @ClientID,100) 
        + ' Group by InquiryStatus,SupplierName)'               
    END    
     
select @index = charindex('Lost',@InquiryStatus) 
if(@index <>0)  
  begin
  if (len(@sql4) >0 or len(@sql3) >0 or len(@sql2) >0 or len(@sql1) >0)
    set @sql5 =  'union'
  set @sql5 = @sql5 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName as Name,
         SUM(StatusCount) as StatusCount
         from (  SELECT InquiryStatus, YEAR(LostDate) AS Year,
                 Month(LostDate) AS Month, COUNT(''Lost'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                             ISNull(Sum(QuotationPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				' +  @ChoosenProductTypes + @suppliers  + ' and BranchID = ' + @BranchID +' 
				 GROUP BY  YEAR(LostDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				            Month(LostDate)
	          ) as tbl
         where InquiryStatus = ''Lost'' and CustomerID =' +Convert(nvarchar(5), @ClientID,100) 
        + ' Group by InquiryStatus,SupplierName)' 
         END 
select @index = charindex('LateResponse',@InquiryStatus) 
if(@index <>0)  
  begin
  if (len(@sql5) >0 or len(@sql4) >0 or len(@sql3) >0 or len(@sql2) >0 or len(@sql1) >0)
    set @sql6 = ' union'
 set @sql6 = @sql6 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName as Name,
         SUM(StatusCount) as StatusCount
         from (  SELECT InquiryStatus, YEAR(LostDate) AS Year,
                 Month(LostDate) AS Month, COUNT(''LateResponse'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                             ISNull(Sum(QuotationPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
                 ' +  @ChoosenProductTypes + @suppliers  + ' and BranchID = ' + @BranchID +' 
				 GROUP BY  YEAR(LostDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				            Month(LostDate)
	          ) as tbl
         where InquiryStatus = ''LateResponse'' and CustomerID =' +Convert(nvarchar(5), @ClientID,100) 
        + ' Group by InquiryStatus,SupplierName)' 
         END 
 select @index = charindex('Regret',@InquiryStatus) 
if(@index <>0)  
  begin
  if (len(@sql6) >0 or len(@sql5) >0 or len(@sql4) >0 or len(@sql3) >0 or len(@sql2) >0 or len(@sql1) >0)
    set @sql7 = ' union'
 set @sql7 = @sql7 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName as Name,
         SUM(StatusCount) as StatusCount
         from (  SELECT InquiryStatus, YEAR(LostDate) AS Year,
                 Month(LostDate) AS Month, COUNT(''Regret'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                             ISNull(Sum(QuotationPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
                  ' +  @ChoosenProductTypes + @suppliers  + ' and BranchID = ' + @BranchID +' 
				 GROUP BY  YEAR(LostDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				            Month(LostDate)
	          ) as tbl
         where InquiryStatus = ''Regret'' and CustomerID =' +Convert(nvarchar(5), @ClientID,100) 
        + ' Group by InquiryStatus,SupplierName)'
         END   
select @index = charindex('Cancelled',@InquiryStatus) 
if(@index <>0)  
  begin
  if (len(@sql7) >0 or len(@sql6) >0 or len(@sql5) >0 or len(@sql4) >0 or len(@sql3) >0 or len(@sql2) >0 or len(@sql1) >0)
    set @sql8 =  ' union'
 set @sql8 = @sql8 +  ' (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,SupplierName as Name,
         SUM(StatusCount) as StatusCount
         from (  SELECT  InquiryStatus, YEAR(LostDate) AS Year,
                 Month(LostDate) AS Month, COUNT(''Cancelled'') AS StatusCount,
                            CustomerID, SupplierID, SupplierName, CompanyName, 
                             ISNull(Sum(QuotationPriceInEuro),0) AS  TotalAmount
				 FROM         #tempViewSubProjectTotals
				' +  @ChoosenProductTypes + @suppliers  + ' and BranchID = ' + @BranchID +' 
				 GROUP BY  YEAR(LostDate), InquiryStatus, CustomerID, 
				          SupplierID, SupplierName, CompanyName, 
				            Month(LostDate)
	          ) as tbl
         where InquiryStatus = ''Cancelled'' and CustomerID =' +Convert(nvarchar(5), @ClientID,100) 
        + ' Group by InquiryStatus,SupplierName)'
END 
 
  
     EXECUTE (N'' + @sql1 + @sql2+ @sql3+ @sql4+ @sql5+ @sql6+ @sql7+ @sql8+ '')
END
