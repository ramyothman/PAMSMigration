CREATE VIEW [dbo].[ViewSupplierTarget]
AS
SELECT        dbo.Suppliers.SupplierName AS Supplier, dbo.SuppliersTargets.Year, dbo.SuppliersTargets.Value AS SupplierTarget, dbo.Suppliers.IsPrincipale, s.OrderPrice, s.OrderYear
FROM            dbo.Suppliers INNER JOIN
                         dbo.SuppliersTargets ON dbo.Suppliers.SupplierID = dbo.SuppliersTargets.SupplierID INNER JOIN
                             (SELECT        i.SupplierID, SUM(o.PriceInEuro) AS OrderPrice, YEAR(o.OrderDate) AS OrderYear
                                FROM            dbo.Orders AS o INNER JOIN
                                                         dbo.Inquiries AS i ON o.InquiryNumber = i.InquiryNumber
                                WHERE        (i.BranchID = 1)
                                GROUP BY i.SupplierID, YEAR(o.OrderDate)) AS s ON s.SupplierID = dbo.SuppliersTargets.SupplierID AND s.OrderYear = dbo.SuppliersTargets.Year
