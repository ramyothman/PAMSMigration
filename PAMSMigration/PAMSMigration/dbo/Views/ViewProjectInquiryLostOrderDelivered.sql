CREATE VIEW [dbo].[ViewProjectInquiryLostOrderDelivered]
AS
SELECT     dbo.ViewProjectInquiryLost.ProjectSerialNumber, dbo.ViewProjectInquiryLost.ShotecNo, dbo.ViewProjectInquiryLost.ResponsibleEngineer, 
                      dbo.ViewProjectInquiryLost.ClientName, dbo.ViewProjectInquiryLost.ClientWebsite, dbo.ViewProjectInquiryLost.ClientInquiryNumber, 
                      dbo.ViewProjectInquiryLost.InquiryDate, dbo.ViewProjectInquiryLost.ProjectStatus, dbo.ViewProjectInquiryLost.InquiryTypeID, 
                      dbo.ViewProjectInquiryLost.SupplierName, dbo.ViewProjectInquiryLost.SupplierQuotationNumber, dbo.ViewProjectInquiryLost.QuotationPrice, 
                      dbo.ViewProjectInquiryLost.QuotationCurrency, dbo.ViewProjectInquiryLost.QuotationRateToEURO, dbo.ViewProjectInquiryLost.QuotationRateDate, 
                      dbo.ViewProjectInquiryLost.QuotationPriceInEuro, dbo.ViewProjectInquiryLost.BidDueDate, dbo.ViewProjectInquiryLost.OnHold, 
                      dbo.ViewProjectInquiryLost.ModifiedDate, dbo.ViewProjectInquiryLost.UserName, dbo.ViewProjectInquiryLost.ProjectName, 
                      dbo.ViewProjectInquiryLost.ProjectLocation, dbo.ViewProjectInquiryLost.ProjectOwnerName, dbo.ViewProjectInquiryLost.ProjectDescription, 
                      dbo.ViewProjectInquiryLost.ProductName, dbo.ViewProjectInquiryLost.CategoryName, dbo.ViewProjectInquiryLost.ProductDescription, 
                      dbo.ViewProjectInquiryLost.ProjectComment, dbo.ViewProjectInquiryLost.ReasonName, dbo.ViewProjectInquiryLost.LostReasonID, 
                      dbo.ViewProjectInquiryLost.LostWinnerName, dbo.ViewProjectInquiryLost.LostWinnerPrice, dbo.ViewProjectInquiryLost.LostWinnerPriceInEuro, 
                      dbo.ViewProjectInquiryLost.LostWinnerRateToEuro, dbo.ViewProjectInquiryLost.LostWinnerRateDate, dbo.ViewProjectInquiryLost.LostWinnerPriceCurrencyID, 
                      dbo.Orders.OrderNumber AS ShotecOrderNumber, dbo.Orders.CustomerOrderNumber, dbo.Orders.SupplierOrderNumber, dbo.Orders.DeliveryTime, 
                      dbo.Orders.DeliveredON, dbo.Orders.Delivered, dbo.Orders.ExpansionDeliveryDate AS ExpectedDeliveryDate, dbo.Orders.PaymentTypeID, dbo.Orders.PriceBaseID, 
                      dbo.Orders.Price AS OrderPrice, dbo.Orders.CurrencyID AS OrderCurrencyID, dbo.Orders.RateToEuro AS OrderRateToEuro, dbo.Orders.ONDate AS OrderRateDate, 
                      dbo.Orders.PriceInEuro AS OrderPriceInEuro, dbo.Orders.OrderDate, dbo.Orders.PriceCommissionBase AS OrderPriceCommissionBase, 
                      dbo.Orders.PercentPriceCommissionBase AS OrderPercentPriceCommissionBase, dbo.ViewProjectInquiryLost.InquiryStatus, dbo.OrderStatus.Name AS OrderStatus, 
                      dbo.ViewProjectInquiryLost.SupplierID, dbo.ViewProjectInquiryLost.LostDate, dbo.ViewProjectInquiryLost.ProjectTypeID, dbo.ViewProjectInquiryLost.OfferDate, 
                      dbo.ViewProjectInquiryLost.ParentInquiryNumber, dbo.Orders.ParentOrderNumber, dbo.Orders.IsSubOrder, dbo.ViewProjectInquiryLost.IsSubOffer, 
                      dbo.ViewProjectInquiryLost.IsSubLost, dbo.ViewProjectInquiryLost.LostParentInquiryNumber, dbo.ViewProjectInquiryLost.CustomerID, 
                      dbo.ViewProjectInquiryLost.LostComment, dbo.ViewProjectInquiryLost.ProductType, dbo.ViewProjectInquiryLost.ProductTypeID, 
                      dbo.ViewProjectInquiryLost.OrderPercentage, dbo.ViewProjectInquiryLost.LostPercentage, dbo.ViewProjectInquiryLost.CancelledPercentage, 
                      dbo.ViewProjectInquiryLost.LateResponsePercentage, dbo.Orders.BackLog, dbo.ViewProjectInquiryLost.OrderChanceID, dbo.ViewProjectInquiryLost.OrderChance, 
                      dbo.ViewProjectInquiryLost.InquiryHasGuarantee, dbo.Orders.CompletedGoodsPaidON, dbo.Orders.IsCompletedGoodsPaid, 
                      dbo.Orders.HasGuarantee AS OrderHasGuarantee, dbo.Orders.OrderStatusID, dbo.ViewProjectInquiryLost.CompanyCode, dbo.ViewProjectInquiryLost.ProjectID, 
                      dbo.ViewProjectInquiryLost.InquiryType, dbo.ViewProjectInquiryLost.QuotationCurrencyCode, dbo.ViewProjectInquiryLost.LostWinnerPriceCurrencyCode, 
                      dbo.Currencies.CurrencyCode AS OrderCurrencyCode, dbo.PriceBase.PriceBaseCode, dbo.PaymentTypes.PaymentType, dbo.ViewProjectInquiryLost.LanguageId, 
                      dbo.ViewProjectInquiryLost.ResponsibleEngineerDisplayName, dbo.ViewProjectInquiryLost.ResponsibleEngineerID, 
                      dbo.ViewProjectInquiryLost.ReasonCode AS LostReasonCode, dbo.ViewProjectInquiryLost.BranchID, dbo.ViewProjectInquiryLost.BranchNameFL, 
                      dbo.ViewProjectInquiryLost.BranchNameSL, dbo.ViewProjectInquiryLost.CountryID, dbo.ViewProjectInquiryLost.CountryName, 
                      dbo.ViewProjectInquiryLost.InquiryPaymentBaseID, dbo.ViewProjectInquiryLost.InquiryPriceBaseID, dbo.Orders.DeliveryTimePeriodID, 
                      dbo.TimePeriod.PeriodName AS OrderDeliveryTimePeriodName, dbo.ViewProjectInquiryLost.FileNo
FROM         dbo.Orders INNER JOIN
                      dbo.Currencies ON dbo.Orders.CurrencyID = dbo.Currencies.ID INNER JOIN
                      dbo.PaymentTypes ON dbo.Orders.PaymentTypeID = dbo.PaymentTypes.ID INNER JOIN
                      dbo.PriceBase ON dbo.Orders.PriceBaseID = dbo.PriceBase.ID INNER JOIN
                      dbo.TimePeriod ON dbo.Orders.DeliveryTimePeriodID = dbo.TimePeriod.TimePeriodID LEFT OUTER JOIN
                      dbo.OrderStatus ON dbo.Orders.OrderStatusID = dbo.OrderStatus.ID RIGHT OUTER JOIN
                      dbo.ViewProjectInquiryLost ON dbo.Orders.InquiryNumber = dbo.ViewProjectInquiryLost.ProjectSerialNumber
