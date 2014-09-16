/****** Object:  View [dbo].[ViewEmployeeWorkLoadOrderAll]    Script Date: 03/20/2013 12:03:16 ******/
CREATE VIEW [dbo].[ViewEmployeeWorkLoadOrderAll]
AS
SELECT     TOP (100) PERCENT ResponsibleEngineerID, BranchID, InquiryNumbers, PointsInquiry, OrderQuotationPriceSum, PointsValueSum, 
                      CAST(CAST(CAST(PointsInquiry AS decimal(26, 10)) + PointsValueSum AS decimal(26, 10)) / dbo.GetTotalPointSum(BranchID) AS decimal(26, 10)) AS PointsSum
FROM         (SELECT     ResponsibleEngineerID, BranchID, COUNT(InquiryNumber) AS InquiryNumbers, COUNT(InquiryNumber) * dbo.GetGeneralPointsInquiries() 
                                              AS PointsInquiry, SUM(OrderPriceInEuro) AS OrderQuotationPriceSum, SUM(PointsValue) AS PointsValueSum
                        FROM         (SELECT     ResponsibleEngineerID, BranchID, InquiryNumber, OrderPriceInEuro, OrderPriceInEuro / dbo.GetGeneralPointsValue() AS PointsValue
                                                FROM         (SELECT     dbo.GetAllInquiries.ResponsibleEngineerID, dbo.GetAllInquiries.InquiryNumber, dbo.GetAllInquiries.BranchID, 
                                                                                              CAST(dbo.Orders.PriceInEuro AS decimal(26, 10)) AS OrderPriceInEuro
                                                                        FROM         dbo.GetAllInquiries INNER JOIN
                                                                                              dbo.Orders ON dbo.GetAllInquiries.InquiryNumber = dbo.Orders.InquiryNumber
                                                                        WHERE     (dbo.GetAllInquiries.InquiryStatus = 'ORDER')) AS a) AS b
                        GROUP BY ResponsibleEngineerID, BranchID) AS c
ORDER BY ResponsibleEngineerID
