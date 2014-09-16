/****** Object:  View [dbo].[GetAllInquiries]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllInquiries]
AS
SELECT     dbo.Inquiries.InquiryNumber, dbo.Inquiries.ResponsibleEngineerID, dbo.Inquiries.InquiryTypeID, dbo.Inquiries.CustomerID, dbo.Inquiries.CustomerInquiryNumber, 
                      dbo.Inquiries.ProductID, dbo.Inquiries.InquiryDate, dbo.Inquiries.BidDueDate, dbo.Inquiries.SupplierID, dbo.Inquiries.SupplierQuotationNumber, 
                      dbo.Inquiries.QuotationPrice, dbo.Inquiries.CurrencyID, dbo.Inquiries.RateToEuro, dbo.Inquiries.ONDate, dbo.Inquiries.QuotationPriceInEuro, dbo.Inquiries.Comment, 
                      dbo.Inquiries.UserName, dbo.Inquiries.ModifiedDate, dbo.Inquiries.ProductDescription, dbo.Inquiries.ShotecNo, dbo.Inquiries.OnHold, dbo.Inquiries.InquiryStatusID, 
                      dbo.ProjectTypes.ProjectType AS ProjectStatus, dbo.Inquiries.ProjectTypeID, dbo.Inquiries.OfferDate, dbo.Inquiries.ParentInquiryNumber, dbo.Inquiries.IsSubOffer, 
                      dbo.Inquiries.ProductTypeID, dbo.Inquiries.OrderPercentage, dbo.Inquiries.LostPercentage, dbo.Inquiries.CancelledPercentage, 
                      dbo.Inquiries.LateResponsePercentage, dbo.Inquiries.OrderChanceID, dbo.OrdersChance.OrderChance, dbo.Inquiries.HasGuarantee, dbo.Inquiries.ProjectID, 
                      dbo.Projects.ProjectCode, dbo.Projects.ProjectName, dbo.InquiryStatus.Name AS InquiryStatus, dbo.InquiryTypes.InquiryType, dbo.Currencies.CurrencyCode, 
                      dbo.Inquiries.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, 
                      dbo.CompanyCountries.CountryName, dbo.Inquiries.PriceBaseID, dbo.Inquiries.PaymentBaseID, dbo.Inquiries.FileNo
FROM         dbo.Inquiries INNER JOIN
                      dbo.ProjectTypes ON 
                      CASE WHEN dbo.Inquiries.ProjectTypeID = 8 THEN 4 WHEN dbo.Inquiries.ProjectTypeID = 9 THEN 5 WHEN dbo.Inquiries.ProjectTypeID = 10 THEN 5 ELSE dbo.Inquiries.ProjectTypeID
                       END = dbo.ProjectTypes.ID INNER JOIN
                      dbo.Projects ON dbo.Inquiries.ProjectID = dbo.Projects.ID INNER JOIN
                      dbo.CompanyBranches INNER JOIN
                      dbo.CompanyCountries ON dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND 
                      dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND 
                      dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID ON 
                      dbo.Inquiries.BranchID = dbo.CompanyBranches.ID LEFT OUTER JOIN
                      dbo.InquiryTypes ON dbo.Inquiries.InquiryTypeID = dbo.InquiryTypes.ID LEFT OUTER JOIN
                      dbo.InquiryStatus ON dbo.Inquiries.InquiryStatusID = dbo.InquiryStatus.ID LEFT OUTER JOIN
                      dbo.Currencies ON dbo.Inquiries.CurrencyID = dbo.Currencies.ID LEFT OUTER JOIN
                      dbo.OrdersChance ON dbo.Inquiries.OrderChanceID = dbo.OrdersChance.ID
