-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNearBidDueDateInquiries]
@ResponsibleEngineerID int,
@IsAll bit ,
@NumOfDays int,
@BranchID int
AS
BEGIN
declare @FromDate datetime
declare @ToDate datetime
declare @DayName nvarchar(15)
set @FromDate = getdate()
--set @ToDate = dateadd(day,@NumOfDays,@FromDate)
 
--set  @FromDate = dateadd(day,-1,@FromDate)
--print(@ToDate)
--print (@DayName)
if(@NumOfDays >5)
  set @NumOfDays = @NumOfDays + (@NumOfDays / 5) * 2
else if(@NumOfDays = 5)
    set @NumOfDays = @NumOfDays + 2
    
set @NumOfDays = @NumOfDays +1
set  @ToDate = dateadd(day,@NumOfDays,@FromDate)
select @DayName = datename(dw,@ToDate)
if(@NumOfDays <5)
   if(@DayName = 'Firday'or @DayName = 'Saturday' )
       set @ToDate = dateadd(day,2,@ToDate)
print(@ToDate)
print(@FromDate)
if(@IsAll = 'True')
SELECT     Inquiries.InquiryNumber, Inquiries.ResponsibleEngineerID, Inquiries.CustomerID, Inquiries.CustomerInquiryNumber, Inquiries.ProjectID, Inquiries.ProductTypeID, 
                      Inquiries.ProductID, Inquiries.InquiryDate, Inquiries.BidDueDate, Inquiries.SupplierID, Inquiries.SupplierQuotationNumber, Inquiries.QuotationPrice, 
                      Inquiries.CurrencyID, Inquiries.RateToEuro, Inquiries.ONDate, Inquiries.QuotationPriceInEuro, Inquiries.Comment, Inquiries.UserName, Inquiries.ModifiedDate, 
                      Inquiries.ProductDescription, Inquiries.ShotecNo, Inquiries.OnHold, Inquiries.InquiryStatusID, Inquiries.OrderPercentage, Inquiries.LostPercentage, 
                      Inquiries.CancelledPercentage, Inquiries.LateResponsePercentage, Inquiries.ProjectTypeID, Inquiries.OfferDate, Inquiries.ParentInquiryNumber, Inquiries.IsSubOffer, 
                      Inquiries.OrderChanceID, Customers.CompanyName, Customers.CompanyCode, Suppliers.SupplierName, Person.PersonLanguages.DisplayName, CASE WHEN DATEDIFF(day, 
                      Inquiries.BidDueDate, getDate()) = 0 THEN 'Today' ELSE CASE WHEN DATEDIFF(day, getDate(), Inquiries.BidDueDate) 
                      = 1 THEN 'Tomorrow' ELSE 'After Tomorrow' END END AS ImergencyType, Currencies.CurrencyCode , InquiryTypes.InquiryType, 
                      Inquiries.InquiryTypeID
FROM         Inquiries INNER JOIN
                      Suppliers ON Inquiries.SupplierID = Suppliers.SupplierID INNER JOIN
                      Customers ON Inquiries.CustomerID = Customers.CustomerID INNER JOIN
                      Person.PersonLanguages ON Inquiries.ResponsibleEngineerID = Person.PersonLanguages.PersonId INNER JOIN
                      InquiryTypes ON Inquiries.InquiryTypeID = InquiryTypes.ID LEFT OUTER JOIN
                      Currencies ON Inquiries.CurrencyID = Currencies.ID
WHERE   Inquiries.BranchID = @BranchID and  (Inquiries.BidDueDate BETWEEN
                          (SELECT     DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate)) AS Expr1) AND
                          (SELECT     DATEADD(dd, 0, DATEDIFF(dd, 0, @ToDate)) AS Expr1)) AND (Inquiries.ProjectTypeID IN (1, 2))
ORDER BY Inquiries.BidDueDate
	
else
SELECT     Inquiries.InquiryNumber, Inquiries.ResponsibleEngineerID, Inquiries.CustomerID, Inquiries.CustomerInquiryNumber, Inquiries.ProjectID, Inquiries.ProductTypeID, 
                      Inquiries.ProductID, Inquiries.InquiryDate, Inquiries.BidDueDate, Inquiries.SupplierID, Inquiries.SupplierQuotationNumber, Inquiries.QuotationPrice, 
                      Inquiries.CurrencyID, Inquiries.RateToEuro, Inquiries.ONDate, Inquiries.QuotationPriceInEuro, Inquiries.Comment, Inquiries.UserName, Inquiries.ModifiedDate, 
                      Inquiries.ProductDescription, Inquiries.ShotecNo, Inquiries.OnHold, Inquiries.InquiryStatusID, Inquiries.OrderPercentage, Inquiries.LostPercentage, 
                      Inquiries.CancelledPercentage, Inquiries.LateResponsePercentage, Inquiries.ProjectTypeID, Inquiries.OfferDate, Inquiries.ParentInquiryNumber, Inquiries.IsSubOffer, 
                      Inquiries.OrderChanceID, Customers.CompanyName, Customers.CompanyCode, Suppliers.SupplierName, Person.PersonLanguages.DisplayName, CASE WHEN DATEDIFF(day, 
                      Inquiries.BidDueDate, getDate()) = 0 THEN 'Today' ELSE CASE WHEN DATEDIFF(day, getDate(), Inquiries.BidDueDate) 
                      = 1 THEN 'Tomorrow' ELSE 'After Tomorrow' END END AS ImergencyType, Inquiries.InquiryTypeID, Currencies.CurrencyCode, Inquiries.CurrencyID AS Expr1, 
                      InquiryTypes.InquiryType
FROM         Inquiries INNER JOIN
                      Suppliers ON Inquiries.SupplierID = Suppliers.SupplierID INNER JOIN
                      Customers ON Inquiries.CustomerID = Customers.CustomerID INNER JOIN
                      Person.PersonLanguages ON Inquiries.ResponsibleEngineerID = Person.PersonLanguages.PersonId INNER JOIN
                      InquiryTypes ON Inquiries.InquiryTypeID = InquiryTypes.ID LEFT OUTER JOIN
                      Currencies ON Inquiries.CurrencyID = Currencies.ID
WHERE      Inquiries.BranchID = @BranchID and (Inquiries.BidDueDate BETWEEN
                          (SELECT     DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate)) AS Expr1) AND
                          (SELECT     DATEADD(dd, 0, DATEDIFF(dd, 0, @ToDate)) AS Expr1)) AND (Inquiries.ProjectTypeID IN (1, 2)) AND 
                      (Inquiries.ResponsibleEngineerID = @ResponsibleEngineerID)
ORDER BY Inquiries.BidDueDate
END
