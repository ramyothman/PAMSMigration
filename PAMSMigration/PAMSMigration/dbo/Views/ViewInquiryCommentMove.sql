CREATE VIEW [dbo].[ViewInquiryCommentMove]
AS
SELECT     dbo.GetAllInquiries.InquiryNumber, dbo.GetAllInquiries.ResponsibleEngineerID, dbo.GetAllInquiries.InquiryTypeID, dbo.GetAllInquiries.CustomerID, 
                      dbo.GetAllInquiries.CustomerInquiryNumber, dbo.GetAllInquiries.ProjectCode, dbo.GetAllInquiries.ProductID, dbo.GetAllInquiries.InquiryDate, 
                      dbo.GetAllInquiries.BidDueDate, dbo.GetAllInquiries.SupplierID, dbo.GetAllInquiries.SupplierQuotationNumber, dbo.GetAllInquiries.QuotationPrice, 
                      dbo.GetAllInquiries.CurrencyID, dbo.GetAllInquiries.RateToEuro, dbo.GetAllInquiries.ONDate, dbo.GetAllInquiries.QuotationPriceInEuro, 
                      dbo.GetAllInquiries.InquiryStatus, dbo.GetAllInquiries.Comment, dbo.GetAllInquiries.UserName, dbo.GetAllInquiries.ModifiedDate, 
                      dbo.GetAllInquiries.ProductDescription, dbo.GetAllInquiries.ShotecNo, dbo.GetAllInquiries.OnHold, dbo.GetAllInquiries.InquiryStatusID, 
                      dbo.GetAllInquiries.OrderPercentage, CASE WHEN CAST(dbo.Orders.Comment AS nvarchar(MAX)) <> '' THEN CAST(dbo.GetAllInquiries.Comment AS nvarchar(MAX)) 
                      + '----------Orders----------------' + CAST(dbo.Orders.Comment AS nvarchar(MAX)) ELSE CAST(dbo.GetAllInquiries.Comment AS nvarchar(MAX)) 
                      END AS CommonComment, dbo.GetAllInquiries.BranchID, dbo.GetAllInquiries.BranchNameFL, dbo.GetAllInquiries.BranchNameSL, dbo.GetAllInquiries.CountryID, 
                      dbo.GetAllInquiries.CountryName
FROM         dbo.GetAllInquiries INNER JOIN
                      dbo.Orders ON dbo.GetAllInquiries.InquiryNumber = dbo.Orders.InquiryNumber
