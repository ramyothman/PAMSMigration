/****** Object:  View [dbo].[ViewMainPageTurnOverPerformanceChart]    Script Date: 03/20/2013 12:03:16 ******/
CREATE VIEW [dbo].[ViewMainPageTurnOverPerformanceChart]
AS
SELECT  dbo.GetAllInquiries.InquiryStatus, dbo.GetAllInquiries.OrderPercentage
		,dbo.Orders.PriceInEuro AS OrderPrice, dbo.GetAllInquiries.ResponsibleEngineerID
		,CASE WHEN OrderDate IS NOT NULL THEN OrderDate ELSE 
		 CASE WHEN Losts.ModifiedDate IS NOT NULL 
           THEN Losts.ModifiedDate ELSE InquiryDate END END AS ProjectDate
         ,dbo.GetAllInquiries.BranchID
FROM     dbo.GetAllInquiries LEFT OUTER JOIN
         dbo.Losts ON dbo.GetAllInquiries.InquiryNumber = dbo.Losts.InquiryNumber LEFT OUTER JOIN
         dbo.Orders ON dbo.GetAllInquiries.InquiryNumber = dbo.Orders.InquiryNumber
