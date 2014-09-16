/****** Object:  View [dbo].[GetAllPartialOrder]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPartialOrder]
AS
SELECT     dbo.PartialOrder.InquiryNumber, dbo.PartialOrder.ProductTypeID, dbo.PartialOrder.ProductID, dbo.PartialOrder.SupplierID, dbo.PartialOrder.Quantity, 
                      dbo.PartialOrder.Remarks, dbo.PartialOrder.ParialDeliveryStatusID, dbo.Suppliers.SupplierName, dbo.PartialDeliveryStatus.PartialDeliveryStatus, 
                      dbo.ProductTypes.ProductType, dbo.Products.ProductName, dbo.Products.ProductDescription, dbo.PartialOrder.IsOrdered, dbo.PartialOrder.UserName, 
                      dbo.PartialOrder.ModifiedDate, dbo.PartialOrder.PartialOrderID, dbo.PartialOrder.ItemTagNumber, dbo.PartialOrder.ItemModelSize, dbo.PartialOrder.ItemOfferPrice, 
                      dbo.PartialOrder.ItemOfferCurrencyID, dbo.PartialOrder.ItemOfferRateToEuro, dbo.PartialOrder.ItemOfferRateDate, dbo.PartialOrder.TotalItemOfferPrice, 
                      dbo.PartialOrder.TotalItemOfferPriceInEuro, dbo.PartialOrder.ItemOrderPrice, dbo.PartialOrder.ItemOrderPriceCurrencyID, dbo.PartialOrder.ItemOrderPriceRateToEuro, 
                      dbo.PartialOrder.TotalItemOrderPrice, dbo.PartialOrder.TotalItemOrderPriceInEuro, dbo.PartialOrder.OrderPriceRateDate
FROM         dbo.PartialOrder LEFT OUTER JOIN
                      dbo.Suppliers ON dbo.PartialOrder.SupplierID = dbo.Suppliers.SupplierID LEFT OUTER JOIN
                      dbo.PartialDeliveryStatus ON dbo.PartialOrder.ParialDeliveryStatusID = dbo.PartialDeliveryStatus.PartialDeliveryStatusID LEFT OUTER JOIN
                      dbo.ProductTypes ON dbo.PartialOrder.ProductTypeID = dbo.ProductTypes.ProductTypeID LEFT OUTER JOIN
                      dbo.Products ON dbo.PartialOrder.ProductID = dbo.Products.ProductID
