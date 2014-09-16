CREATE VIEW [dbo].[GetAllProduct]
AS
SELECT        dbo.Product.ProductID, dbo.Product.CategoryID, dbo.Product.Name, dbo.Product.Col1, dbo.Product.Col2, dbo.Product.Col3, dbo.Product.Col4, 
                         dbo.Product.Col5, dbo.Product.Col6, dbo.Product.Col7, dbo.Product.Col8, dbo.Product.Col9, dbo.Product.Col10, dbo.Product.Col11, dbo.Product.Col12, 
                         dbo.Product.Col13, dbo.Product.Col14, dbo.Product.Col15, dbo.Product.Col16, dbo.Product.Col17, dbo.Product.Col18, dbo.Product.Col19, dbo.Product.Col20, 
                         dbo.Product.Col21, dbo.Product.Col22, dbo.Product.Col23, dbo.Product.Col24, dbo.Product.Col25, dbo.Product.Col26, dbo.Product.Col27, dbo.Product.Col28, 
                         dbo.Product.Col29, dbo.Product.Col30, dbo.Product.ProductTypeID, dbo.Product.CostPrice, dbo.Product.CurrencyID, dbo.Product.RateToEuro, 
                         dbo.Product.CostPriceInEuro, dbo.Category.Name AS Category
FROM            dbo.Product INNER JOIN
                         dbo.Category ON dbo.Product.CategoryID = dbo.Category.CategoryID
UNION
SELECT        - 1, 0, 'Add New Product', Cast(0 as decimal(18,2)), Cast(0 as decimal(18,2)), Cast(0 as decimal(18,2)), Cast(0 as decimal(18,2)), Cast(0 as decimal(18,2)), Cast(0 as decimal(18,2)), Cast(0 as decimal(18,2)), Cast(0 as decimal(18,2)), Cast(0 as decimal(18,2)), Cast(0 as decimal(18,2)),
 Cast(0 as bit), Cast(0 as bit),  Cast(0 as bit),  Cast(0 as bit),  Cast(0 as bit),  Cast(0 as bit),  Cast(0 as bit),  Cast(0 as bit),  Cast(0 as bit),  Cast(0 as bit), '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, ''
