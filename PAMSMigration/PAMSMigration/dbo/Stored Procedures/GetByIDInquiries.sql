CREATE PROCEDURE [dbo].[GetByIDInquiries]
    @InquiryNumber nvarchar(50)
AS
BEGIN
SELECT     Inquiries.InquiryNumber, Inquiries.ResponsibleEngineerID, Inquiries.InquiryTypeID, Inquiries.CustomerID, Inquiries.CustomerInquiryNumber, 
                      Inquiries.ProjectID, Inquiries.ProductID, Inquiries.InquiryDate, Inquiries.BidDueDate, Inquiries.SupplierID, Inquiries.SupplierQuotationNumber, 
                      Inquiries.QuotationPrice, Inquiries.CurrencyID, Inquiries.RateToEuro, Inquiries.ONDate, Inquiries.QuotationPriceInEuro, 
                      ProjectTypes.ProjectType AS InquiryStatus, Inquiries.Comment, Inquiries.UserName, Inquiries.ModifiedDate, Inquiries.ProductDescription, 
                      Inquiries.ShotecNo, Inquiries.OnHold, Inquiries.InquiryStatusID, Inquiries.OrderPercentage, Inquiries.ProjectTypeID, Inquiries.OfferDate, 
                      Inquiries.ParentInquiryNumber, Inquiries.IsSubOffer, Inquiries.ProductTypeID, Inquiries.LostPercentage, Inquiries.CancelledPercentage, 
                      Inquiries.LateResponsePercentage, OrdersChance.OrderChance, Inquiries.OrderChanceID, Inquiries.HasGuarantee, Inquiries.BranchID, Inquiries.PriceBaseID, Inquiries.PaymentBaseID, Inquiries.FileNo
FROM         Inquiries INNER JOIN
                      ProjectTypes ON Inquiries.ProjectTypeID = ProjectTypes.ID LEFT OUTER JOIN
                      OrdersChance ON Inquiries.OrderChanceID = OrdersChance.ID
WHERE     (Inquiries.InquiryNumber = @InquiryNumber)
END
