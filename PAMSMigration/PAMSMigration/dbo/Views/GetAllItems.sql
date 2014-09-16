CREATE VIEW [dbo].[GetAllItems]
AS
--Select *
--From [dbo].[Items]
SELECT     ItemID, ProductTypeID, Name, CategoryID, CostPrice, CurrencyID, RateToEuro, CostPriceInEuro
FROM         Items
union 
select -1 ,0,'Add New Item', 0 , 0,0,0,0
