/****** Object:  View [dbo].[ViewSupplierWorkLoad]    Script Date: 03/20/2013 12:03:16 ******/
CREATE VIEW [dbo].[ViewSupplierWorkLoad]
AS
SELECT     TOP (100) PERCENT SupplierID, InquiryType, BranchID, InquiryNumbers, PointsInquiry, InquiryQuotationPriceSum, PointsValueSum, 
                      CAST(CAST(CAST(PointsInquiry AS decimal(26, 10)) + PointsValueSum AS decimal(26, 10)) / dbo.GetTotalPointSum(BranchID) AS decimal(26, 10)) AS PointsSum
FROM         (SELECT     SupplierID, InquiryType, BranchID, COUNT(InquiryNumber) AS InquiryNumbers, COUNT(InquiryNumber) * dbo.GetGeneralPointsInquiries() 
                                              AS PointsInquiry, SUM(QuotationPriceInEuro) AS InquiryQuotationPriceSum, SUM(PointsValue) AS PointsValueSum
                        FROM         (SELECT     SupplierID, InquiryNumber, InquiryType, BranchID, QuotationPriceInEuro, QuotationPriceInEuro / dbo.GetGeneralPointsValue() 
                                                                      AS PointsValue
                                                FROM         (SELECT     SupplierID, InquiryNumber, InquiryType, BranchID, CAST(QuotationPriceInEuro AS decimal(26, 10)) AS QuotationPriceInEuro
                                                                        FROM         dbo.GetAllInquiries
                                                                        WHERE     (InquiryStatus = 'INQUIRY') AND (InquiryType IN ('Firm', 'Service', 'Other'))) AS a) AS b
                        GROUP BY SupplierID, InquiryType, BranchID) AS c
ORDER BY SupplierID
