CREATE VIEW [dbo].[ViewCalculationSheet]
AS
SELECT     dbo.CalculationSheet.CalculationSheetID, dbo.CalculationSheet.InquiryNumber, dbo.Currencies.CurrencyCode AS OfferCurrencyCode, 
                      dbo.CalculationSheet.OfferCurrencyID, dbo.CalculationSheet.RiskFactorPercentage, dbo.CalculationSheet.Margin, dbo.CalculationSheet.RequiredDestination, 
                      dbo.CalculationSheet.Memo, dbo.CalculationSheet.Reference, dbo.CalculationSheet.TotalWithoutTaxes, dbo.CalculationSheet.Total, dbo.CalculationSheet.SheetDate, 
                      Person.PersonLanguages.DisplayName AS ResponsibleEngineer, dbo.Inquiries.CustomerInquiryNumber, dbo.Customers.CompanyName AS ClientName, 
                      dbo.Customers.CompanyCode AS ClientCode, dbo.CalculationSheet.Deduction, dbo.Inquiries.InquiryDate, dbo.Inquiries.ShotecNo, dbo.Inquiries.InquiryStatusID, 
                      dbo.Inquiries.ProjectTypeID, dbo.InquiryTypes.InquiryType, dbo.InquiryStatus.Name AS InquiryStatus, dbo.Inquiries.OfferDate, dbo.Inquiries.BidDueDate, 
                      dbo.Inquiries.ProjectID, dbo.Projects.ProjectCode, dbo.Projects.ProjectName, dbo.Inquiries.ProductDescription, dbo.Inquiries.ProductTypeID, 
                      dbo.ProductType.Name AS ProductTypeName, dbo.Inquiries.BranchID, dbo.CalculationSheet.SalesTax
FROM         dbo.CalculationSheet INNER JOIN
                      dbo.Inquiries ON dbo.CalculationSheet.InquiryNumber = dbo.Inquiries.InquiryNumber LEFT OUTER JOIN
                      dbo.Currencies ON dbo.CalculationSheet.OfferCurrencyID = dbo.Currencies.ID LEFT OUTER JOIN
                      Person.PersonLanguages ON dbo.Inquiries.ResponsibleEngineerID = Person.PersonLanguages.PersonId LEFT OUTER JOIN
                      dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID LEFT OUTER JOIN
                      dbo.InquiryStatus ON dbo.Currencies.ID = dbo.InquiryStatus.ID LEFT OUTER JOIN
                      dbo.InquiryTypes ON dbo.Inquiries.InquiryTypeID = dbo.InquiryTypes.ID AND dbo.Inquiries.InquiryTypeID = dbo.InquiryTypes.ID LEFT OUTER JOIN
                      dbo.Projects ON dbo.Currencies.ID = dbo.Projects.ID LEFT OUTER JOIN
                      dbo.ProductType ON dbo.Inquiries.ProductTypeID = dbo.ProductType.ProductTypeID
