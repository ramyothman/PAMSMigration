/****** Object:  View [dbo].[GetAllOrders]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllOrders]
AS
SELECT     InquiryNumber, OrderNumber, CustomerOrderNumber, SupplierOrderNumber, OrderDate, DeliveryTime, ExpansionDeliveryDate, PaymentTypeID, PriceBaseID, Price, 
                      CurrencyID, RateToEuro, ONDate, PriceInEuro, DeliveredON, Delivered, Comment, UserName, ModifiedDate, PriceCommissionBase, PercentPriceCommissionBase, 
                      OrderStatusID, ParentOrderNumber, IsSubOrder, BackLog, CompletedGoodsPaidON, IsCompletedGoodsPaid, HasGuarantee, DeliveryTimePeriodID, 
                      DiscountValue
FROM         dbo.Orders
