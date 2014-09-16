CREATE VIEW [dbo].[ViewProjectInquiryYearlyHistory]
AS
SELECT     dbo.GetAllInquiriesYearlyHistory.InquiryNumber AS ProjectSerialNumber, dbo.GetAllInquiriesYearlyHistory.ShotecNo, dbo.Customers.CompanyName AS ClientName, 
                      dbo.Customers.CompanyWebSite AS ClientWebsite, dbo.GetAllInquiriesYearlyHistory.CustomerInquiryNumber AS ClientInquiryNumber, 
                      dbo.GetAllInquiriesYearlyHistory.InquiryDate, dbo.GetAllInquiriesYearlyHistory.InquiryStatus AS OfferStatus, dbo.GetAllInquiriesYearlyHistory.InquiryTypeID, 
                      dbo.Suppliers.SupplierName, dbo.GetAllInquiriesYearlyHistory.SupplierQuotationNumber, dbo.GetAllInquiriesYearlyHistory.QuotationPrice, 
                      dbo.GetAllInquiriesYearlyHistory.CurrencyID AS QuotationCurrency, dbo.GetAllInquiriesYearlyHistory.RateToEuro AS QuotationRateToEURO, 
                      dbo.GetAllInquiriesYearlyHistory.ONDate AS QuotationRateDate, dbo.GetAllInquiriesYearlyHistory.QuotationPriceInEuro, 
                      dbo.GetAllInquiriesYearlyHistory.BidDueDate, dbo.GetAllInquiriesYearlyHistory.OnHold, dbo.GetAllInquiriesYearlyHistory.ModifiedDate, 
                      dbo.GetAllInquiriesYearlyHistory.UserName, dbo.Projects.ProjectName, dbo.Projects.ProjectLocation, dbo.Projects.ProjectDescription, dbo.Products.ProductName, 
                      dbo.Categories.CategoryName, dbo.GetAllInquiriesYearlyHistory.ProductDescription, dbo.GetAllInquiriesYearlyHistory.Comment AS ProjectComment, 
                      dbo.InquiryStatus.Name AS InquiryStatus, dbo.Suppliers.SupplierID, dbo.GetAllInquiriesYearlyHistory.ProjectTypeID, dbo.GetAllInquiriesYearlyHistory.OfferDate, 
                      dbo.GetAllInquiriesYearlyHistory.ParentInquiryNumber, dbo.GetAllInquiriesYearlyHistory.IsSubOffer, dbo.GetAllInquiriesYearlyHistory.CustomerID, 
                      dbo.ProductTypes.ProductType, dbo.GetAllInquiriesYearlyHistory.ProductTypeID, dbo.GetAllInquiriesYearlyHistory.OrderPercentage, 
                      dbo.GetAllInquiriesYearlyHistory.LostPercentage, dbo.GetAllInquiriesYearlyHistory.CancelledPercentage, dbo.GetAllInquiriesYearlyHistory.LateResponsePercentage, 
                      dbo.GetAllInquiriesYearlyHistory.OrderChanceID, dbo.GetAllInquiriesYearlyHistory.OrderChance, 
                      dbo.GetAllInquiriesYearlyHistory.HasGuarantee AS InquiryHasGuarantee, dbo.Customers.CompanyCode, dbo.GetAllInquiriesYearlyHistory.ProjectID, 
                      dbo.GetAllInquiriesYearlyHistory.ProjectCode, dbo.GetAllInquiriesYearlyHistory.InquiryStatusID, dbo.GetAllInquiriesYearlyHistory.InquiryType, 
                      dbo.GetAllInquiriesYearlyHistory.CurrencyCode, dbo.GetAllInquiriesYearlyHistory.ProjectStatus, dbo.GetAllInquiriesYearlyHistory.ResponsibleEngineerID, 
                      Person.PersonLanguages.DisplayName AS ResponsibleEngineer, Person.PersonLanguages.DisplayName AS ResponsibleEngineerDisplayName, 
                      Person.PersonLanguages.LanguageId, ISNULL(Customers_1.CompanyCode, N' ') AS ProjectOwnerName, dbo.GetAllInquiriesYearlyHistory.Year, 
                      dbo.GetAllInquiriesYearlyHistory.BranchID
FROM         dbo.ProductTypes RIGHT OUTER JOIN
                      dbo.GetAllInquiriesYearlyHistory INNER JOIN
                      dbo.Suppliers ON dbo.GetAllInquiriesYearlyHistory.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                      dbo.Products ON dbo.GetAllInquiriesYearlyHistory.ProductID = dbo.Products.ProductID INNER JOIN
                      dbo.Categories ON dbo.Products.CategoryID = dbo.Categories.CategoryID INNER JOIN
                      dbo.Projects ON dbo.GetAllInquiriesYearlyHistory.ProjectID = dbo.Projects.ID INNER JOIN
                      dbo.Customers ON dbo.GetAllInquiriesYearlyHistory.CustomerID = dbo.Customers.CustomerID INNER JOIN
                      Person.PersonLanguages ON dbo.GetAllInquiriesYearlyHistory.ResponsibleEngineerID = Person.PersonLanguages.PersonId LEFT OUTER JOIN
                      dbo.Customers AS Customers_1 ON dbo.Projects.OwnerID = Customers_1.CustomerID ON 
                      dbo.ProductTypes.ProductTypeID = dbo.GetAllInquiriesYearlyHistory.ProductTypeID LEFT OUTER JOIN
                      dbo.InquiryStatus ON dbo.GetAllInquiriesYearlyHistory.InquiryStatusID = dbo.InquiryStatus.ID
