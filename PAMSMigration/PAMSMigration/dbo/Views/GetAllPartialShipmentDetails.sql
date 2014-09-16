/****** Object:  View [dbo].[GetAllPartialShipmentDetails]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPartialShipmentDetails]
AS
SELECT     dbo.PartialShipmentDetails.PartialShipmentDetailsID, dbo.PartialShipmentDetails.PartialDeliveryID, dbo.PartialShipmentDetails.UserName, 
                      dbo.PartialShipmentDetails.ModifiedDate, dbo.PartialShipmentDetails.Quantity, dbo.PartialOrder.ItemTagNumber, dbo.PartialOrder.PartialOrderID, 
                      dbo.PartialOrder.ItemModelSize, dbo.PartialOrder.InquiryNumber, dbo.PartialOrder.Quantity AS PartialDelivredQuantity, dbo.PartialShipment.ShipmentNumber, 
                      dbo.PartialShipment.InvoiceNumber, dbo.PartialShipment.ShipmentDate, dbo.PartialShipment.ItemDescription, 
                      dbo.PartialShipmentDetails.PartialShipmentDescription, dbo.PartialShipmentDetails.PriceInEuro, dbo.PartialShipmentDetailsType.PartialShipmentDetailsType, 
                      dbo.PartialShipment.PartialShipmentID, dbo.PartialShipmentDetails.PartialShipmentTypeID
FROM         dbo.PartialShipmentDetails INNER JOIN
                      dbo.PartialOrder ON dbo.PartialShipmentDetails.PartialDeliveryID = dbo.PartialOrder.PartialOrderID INNER JOIN
                      dbo.PartialShipment ON dbo.PartialShipmentDetails.PartialShipmentID = dbo.PartialShipment.PartialShipmentID INNER JOIN
                      dbo.PartialShipmentDetailsType ON dbo.PartialShipmentDetails.PartialShipmentTypeID = dbo.PartialShipmentDetailsType.PartialShipmentDetailsTypeID
