/****** Object:  View [dbo].[ViewSupplierWorkLoadOrderAll]    Script Date: 03/20/2013 12:03:16 ******/
CREATE VIEW [dbo].[ViewSupplierWorkLoadOrderAll]
AS
SELECT     TOP (100) PERCENT SupplierID, InquiryNumbers, PointsInquiry, BranchID, OrderQuotationPriceSum, PointsValueSum, CAST(CAST(CAST(PointsInquiry AS decimal(26, 
                      10)) + PointsValueSum AS decimal(26, 10)) / dbo.GetTotalPointSum(BranchID) AS decimal(26, 10)) AS PointsSum
FROM         (SELECT     SupplierID, COUNT(InquiryNumber) AS InquiryNumbers, BranchID, COUNT(InquiryNumber) * dbo.GetGeneralPointsInquiries() AS PointsInquiry, 
                                              SUM(OrderPriceInEuro) AS OrderQuotationPriceSum, SUM(PointsValue) AS PointsValueSum
                        FROM         (SELECT     SupplierID, InquiryNumber, BranchID, OrderPriceInEuro, OrderPriceInEuro / dbo.GetGeneralPointsValue() AS PointsValue
                                                FROM         (SELECT     dbo.GetAllInquiries.SupplierID, dbo.GetAllInquiries.InquiryNumber, dbo.GetAllInquiries.BranchID, 
                                                                                              CAST(dbo.Orders.PriceInEuro AS decimal(26, 10)) AS OrderPriceInEuro
                                                                        FROM         dbo.GetAllInquiries INNER JOIN
                                                                                              dbo.Orders ON dbo.GetAllInquiries.InquiryNumber = dbo.Orders.InquiryNumber
                                                                        WHERE     (dbo.GetAllInquiries.InquiryStatus = 'ORDER')) AS a) AS b
                        GROUP BY SupplierID, BranchID) AS c
ORDER BY SupplierID
