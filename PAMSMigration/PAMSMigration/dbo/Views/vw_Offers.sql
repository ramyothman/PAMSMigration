CREATE VIEW [dbo].[vw_Offers]
AS
SELECT        dbo.Customers.CompanyCode AS ClientCode, dbo.Customers.CompanyName AS ClientName, dbo.Offers.OfferID, dbo.Offers.ClientID, dbo.Offers.OfferNo, dbo.Offers.TotalPrice, dbo.Offers.RateToEuro, 
                         dbo.Offers.TotalPriceInEuro, dbo.Offers.Discount, dbo.Offers.DiscountInEuro, dbo.Currencies.CurrencyCode, dbo.Offers.CurrencyID, dbo.Offers.CreationDate, dbo.Offers.OfferDate, 
                         dbo.Offers.TotalWithTaxesInEuro, dbo.Offers.TotalPriceWithTaxes, dbo.Offers.IsCompletelyOrdered, dbo.Offers.CalculationSheetID, dbo.Customers.ContactAddress AS ClientAddress, 
                         dbo.Customers.ContactMobile AS ClientMobile, dbo.Customers.ContactWorkPhone AS ClientWorkPhone
FROM            dbo.Offers LEFT OUTER JOIN
                         dbo.Customers ON dbo.Offers.ClientID = dbo.Customers.CustomerID LEFT OUTER JOIN
                         dbo.Currencies ON dbo.Offers.CurrencyID = dbo.Currencies.ID
