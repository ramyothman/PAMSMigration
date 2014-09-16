CREATE VIEW [dbo].[vw_OfferDetails]
AS
SELECT        dbo.OfferDetails.OfferDetailsID, dbo.OfferDetails.OfferID, dbo.OfferDetails.Price, dbo.OfferDetails.PriceWithTaxes, dbo.OfferDetails.RateToEuro, dbo.OfferDetails.PriceInEuro, 
                         dbo.OfferDetails.PriceWithTaxesInEuro, dbo.OfferDetails.Discount, dbo.OfferDetails.DiscountInEuro, dbo.OfferDetails.CurrencyID, dbo.OfferDetails.IsOrdered, dbo.OfferDetails.Qty, dbo.OfferDetails.ItemID, 
                         dbo.Items.Name AS ItemName, dbo.Category.Name AS CategoryName, Category_1.Name AS ParentCategoryName, dbo.Currencies.CurrencyCode
FROM            dbo.OfferDetails INNER JOIN
                         dbo.Currencies ON dbo.OfferDetails.CurrencyID = dbo.Currencies.ID LEFT OUTER JOIN
                         dbo.Items ON dbo.OfferDetails.ItemID = dbo.Items.ItemID LEFT OUTER JOIN
                         dbo.Category ON dbo.Items.CategoryID = dbo.Category.CategoryID LEFT OUTER JOIN
                         dbo.Category AS Category_1 ON dbo.Category.Category2ID = Category_1.CategoryID
