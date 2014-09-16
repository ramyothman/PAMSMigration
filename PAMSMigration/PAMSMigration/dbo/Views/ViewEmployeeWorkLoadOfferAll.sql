﻿/****** Object:  View [dbo].[ViewEmployeeWorkLoadOfferAll]    Script Date: 03/20/2013 12:03:16 ******/
CREATE VIEW [dbo].[ViewEmployeeWorkLoadOfferAll]
AS
SELECT     TOP (100) PERCENT ResponsibleEngineerID, InquiryType, BranchID, InquiryNumbers, PointsInquiry, InquiryQuotationPriceSum, PointsValueSum, 
                      CAST(CAST(CAST(PointsInquiry AS decimal(26, 10)) + PointsValueSum AS decimal(26, 10)) / dbo.GetTotalPointSum(BranchID) AS decimal(26, 10)) AS PointsSum
FROM         (SELECT     ResponsibleEngineerID, InquiryType, BranchID, COUNT(InquiryNumber) AS InquiryNumbers, COUNT(InquiryNumber) * dbo.GetGeneralPointsInquiries() 
                                              AS PointsInquiry, SUM(QuotationPriceInEuro) AS InquiryQuotationPriceSum, SUM(PointsValue) AS PointsValueSum
                        FROM         (SELECT     ResponsibleEngineerID, InquiryNumber, InquiryType, BranchID, QuotationPriceInEuro, QuotationPriceInEuro / dbo.GetGeneralPointsValue() 
                                                                      AS PointsValue
                                                FROM         (SELECT     ResponsibleEngineerID, InquiryNumber, InquiryType, BranchID, CAST(QuotationPriceInEuro AS decimal(26, 10)) 
                                                                                              AS QuotationPriceInEuro
                                                                        FROM         dbo.GetAllInquiries
                                                                        WHERE     (InquiryStatus = 'Offer') AND (InquiryType IN ('Firm', 'Service', 'Other'))) AS a) AS b
                        GROUP BY ResponsibleEngineerID, InquiryType, BranchID) AS c
ORDER BY ResponsibleEngineerID
