CREATE VIEW [dbo].[GetAllOrdersChance]
AS
SELECT     ID, OrderChance, UserName, ModifiedDate
FROM         dbo.OrdersChance
