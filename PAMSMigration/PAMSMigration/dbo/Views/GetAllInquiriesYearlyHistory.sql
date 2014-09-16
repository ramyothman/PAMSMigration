CREATE VIEW [dbo].[GetAllInquiriesYearlyHistory]
AS
SELECT     dbo.InquiriesYearlyHistory.InquiryNumber, dbo.InquiriesYearlyHistory.ResponsibleEngineerID, dbo.InquiriesYearlyHistory.InquiryTypeID, 
                      dbo.InquiriesYearlyHistory.CustomerID, dbo.InquiriesYearlyHistory.CustomerInquiryNumber, dbo.InquiriesYearlyHistory.ProductID, 
                      dbo.InquiriesYearlyHistory.InquiryDate, dbo.InquiriesYearlyHistory.BidDueDate, dbo.InquiriesYearlyHistory.SupplierID, 
                      dbo.InquiriesYearlyHistory.SupplierQuotationNumber, dbo.InquiriesYearlyHistory.QuotationPrice, dbo.InquiriesYearlyHistory.CurrencyID, 
                      dbo.InquiriesYearlyHistory.RateToEuro, dbo.InquiriesYearlyHistory.ONDate, dbo.InquiriesYearlyHistory.QuotationPriceInEuro, dbo.InquiriesYearlyHistory.Comment, 
                      dbo.InquiriesYearlyHistory.UserName, dbo.InquiriesYearlyHistory.ModifiedDate, dbo.InquiriesYearlyHistory.ProductDescription, 
                      dbo.InquiriesYearlyHistory.ShotecNo, dbo.InquiriesYearlyHistory.OnHold, dbo.InquiriesYearlyHistory.InquiryStatusID, dbo.ProjectTypes.ProjectType AS ProjectStatus, 
                      dbo.InquiriesYearlyHistory.ProjectTypeID, dbo.InquiriesYearlyHistory.OfferDate, dbo.InquiriesYearlyHistory.ParentInquiryNumber, 
                      dbo.InquiriesYearlyHistory.IsSubOffer, dbo.InquiriesYearlyHistory.ProductTypeID, dbo.InquiriesYearlyHistory.OrderPercentage, 
                      dbo.InquiriesYearlyHistory.LostPercentage, dbo.InquiriesYearlyHistory.CancelledPercentage, dbo.InquiriesYearlyHistory.LateResponsePercentage, 
                      dbo.InquiriesYearlyHistory.OrderChanceID, dbo.OrdersChance.OrderChance, dbo.InquiriesYearlyHistory.HasGuarantee, dbo.InquiriesYearlyHistory.ProjectID, 
                      dbo.Projects.ProjectCode, dbo.Projects.ProjectName, dbo.InquiryStatus.Name AS InquiryStatus, dbo.InquiryTypes.InquiryType, dbo.Currencies.CurrencyCode, 
                      dbo.InquiriesYearlyHistory.Year, dbo.InquiriesYearlyHistory.BranchID
FROM         dbo.InquiriesYearlyHistory INNER JOIN
                      dbo.ProjectTypes ON dbo.InquiriesYearlyHistory.ProjectTypeID = dbo.ProjectTypes.ID INNER JOIN
                      dbo.Projects ON dbo.InquiriesYearlyHistory.ProjectID = dbo.Projects.ID LEFT OUTER JOIN
                      dbo.InquiryTypes ON dbo.InquiriesYearlyHistory.InquiryTypeID = dbo.InquiryTypes.ID LEFT OUTER JOIN
                      dbo.InquiryStatus ON dbo.InquiriesYearlyHistory.InquiryStatusID = dbo.InquiryStatus.ID LEFT OUTER JOIN
                      dbo.Currencies ON dbo.InquiriesYearlyHistory.CurrencyID = dbo.Currencies.ID LEFT OUTER JOIN
                      dbo.OrdersChance ON dbo.InquiriesYearlyHistory.OrderChanceID = dbo.OrdersChance.ID
