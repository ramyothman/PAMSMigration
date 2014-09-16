/****** Object:  View [dbo].[GetAllOffersTemplatesItems]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllOffersTemplatesItems]
AS
SELECT     ID, OfferTemplateID, ItemNumber, Item, Description, Qty, UnitPrice, TotalPrice, UserName, ModifiedDate
FROM         dbo.OffersTemplatesItems
