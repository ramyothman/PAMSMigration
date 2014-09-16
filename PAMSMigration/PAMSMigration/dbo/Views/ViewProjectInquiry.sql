CREATE VIEW [dbo].[ViewProjectInquiry]
AS
SELECT     dbo.GetAllInquiries.InquiryNumber AS ProjectSerialNumber, dbo.GetAllInquiries.ShotecNo, dbo.Customers.CompanyName AS ClientName, 
                      dbo.Customers.CompanyWebSite AS ClientWebsite, dbo.GetAllInquiries.CustomerInquiryNumber AS ClientInquiryNumber, dbo.GetAllInquiries.InquiryDate, 
                      dbo.GetAllInquiries.InquiryStatus AS OfferStatus, dbo.GetAllInquiries.InquiryTypeID, dbo.Suppliers.SupplierName, dbo.GetAllInquiries.SupplierQuotationNumber, 
                      dbo.GetAllInquiries.QuotationPrice, dbo.GetAllInquiries.CurrencyID AS QuotationCurrency, dbo.GetAllInquiries.RateToEuro AS QuotationRateToEURO, 
                      dbo.GetAllInquiries.ONDate AS QuotationRateDate, dbo.GetAllInquiries.QuotationPriceInEuro, dbo.GetAllInquiries.BidDueDate, dbo.GetAllInquiries.OnHold, 
                      dbo.GetAllInquiries.ModifiedDate, dbo.GetAllInquiries.UserName, dbo.Projects.ProjectName, dbo.Projects.ProjectLocation, dbo.Projects.ProjectDescription, 
                      dbo.GetAllInquiries.ProductDescription, dbo.GetAllInquiries.Comment AS ProjectComment, dbo.InquiryStatus.Name AS InquiryStatus, dbo.Suppliers.SupplierID, 
                      dbo.GetAllInquiries.ProjectTypeID, dbo.GetAllInquiries.OfferDate, dbo.GetAllInquiries.ParentInquiryNumber, dbo.GetAllInquiries.IsSubOffer, 
                      dbo.GetAllInquiries.CustomerID, dbo.ProductTypes.ProductType, dbo.GetAllInquiries.ProductTypeID, dbo.GetAllInquiries.OrderPercentage, 
                      dbo.GetAllInquiries.LostPercentage, dbo.GetAllInquiries.CancelledPercentage, dbo.GetAllInquiries.LateResponsePercentage, dbo.GetAllInquiries.OrderChanceID, 
                      dbo.GetAllInquiries.OrderChance, dbo.GetAllInquiries.HasGuarantee AS InquiryHasGuarantee, dbo.Customers.CompanyCode, dbo.GetAllInquiries.ProjectID, 
                      dbo.GetAllInquiries.ProjectCode, dbo.GetAllInquiries.InquiryStatusID, dbo.GetAllInquiries.InquiryType, dbo.GetAllInquiries.CurrencyCode, 
                      dbo.GetAllInquiries.ProjectStatus, dbo.GetAllInquiries.ResponsibleEngineerID, Person.PersonLanguages.DisplayName AS ResponsibleEngineer, 
                      Person.PersonLanguages.DisplayName AS ResponsibleEngineerDisplayName, Person.PersonLanguages.LanguageId, ISNULL(Customers_1.CompanyCode, N' ') 
                      AS ProjectOwnerName, dbo.GetAllInquiries.BranchID, dbo.GetAllInquiries.BranchNameFL, dbo.GetAllInquiries.BranchNameSL, dbo.GetAllInquiries.CountryID, 
                      dbo.GetAllInquiries.CountryName, dbo.Category.Name AS ProductName, dbo.Category.Name AS CategoryName, 
                      dbo.GetAllInquiries.PriceBaseID AS InquiryPriceBaseID, dbo.GetAllInquiries.PaymentBaseID AS InquiryPaymentBaseID, dbo.GetAllInquiries.FileNo
FROM         dbo.Customers AS Customers_1 RIGHT OUTER JOIN
                      dbo.Category RIGHT OUTER JOIN
                      dbo.Projects RIGHT OUTER JOIN
                      dbo.GetAllInquiries INNER JOIN
                      dbo.Suppliers ON dbo.GetAllInquiries.SupplierID = dbo.Suppliers.SupplierID ON dbo.Projects.ID = dbo.GetAllInquiries.ProjectID LEFT OUTER JOIN
                      Person.PersonLanguages ON dbo.GetAllInquiries.ResponsibleEngineerID = Person.PersonLanguages.PersonId ON 
                      dbo.Category.CategoryID = dbo.GetAllInquiries.ProductID LEFT OUTER JOIN
                      dbo.Customers ON dbo.GetAllInquiries.CustomerID = dbo.Customers.CustomerID ON Customers_1.CustomerID = dbo.Projects.OwnerID LEFT OUTER JOIN
                      dbo.ProductTypes ON dbo.GetAllInquiries.ProductTypeID = dbo.ProductTypes.ProductTypeID LEFT OUTER JOIN
                      dbo.InquiryStatus ON dbo.GetAllInquiries.InquiryStatusID = dbo.InquiryStatus.ID
