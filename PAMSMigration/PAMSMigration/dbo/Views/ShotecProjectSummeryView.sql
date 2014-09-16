CREATE VIEW [dbo].[ShotecProjectSummeryView]
AS
SELECT        dbo.Inquiries.ShotecNo AS ProjectSerialNumber, Person.PersonLanguages.DisplayName AS Employee, dbo.Customers.CompanyCode AS Client, dbo.Suppliers.SupplierName AS Supplier, 
                         dbo.InquiryTypes.InquiryType, dbo.ProjectTypes.ProjectType, dbo.OrdersChance.OrderChance, dbo.Projects.ProjectCode AS Project, dbo.Inquiries.InquiryDate, dbo.Inquiries.BidDueDate, dbo.Inquiries.OfferDate, 
                         dbo.Orders.OrderDate, dbo.Orders.DeliveredON, dbo.Orders.Delivered, dbo.LostReasons.ReasonName AS LostReason, dbo.Inquiries.QuotationPriceInEuro, dbo.Orders.PriceInEuro AS OrderPriceInEuro, 
                         dbo.Commissions.CommissionAmountInEuro, CAST(ISNULL(dbo.view_SubViewCommissionAmounts.PaidCommissionAmount, 0) AS decimal(18, 2)) AS PaidCommissionAmount, 
                         CAST(ISNULL(dbo.view_SubViewCommissionAmounts.RemainingCommissionAmount, 0) AS decimal(18, 2)) AS RemainingCommissionAmount, 
                         dbo.ViewPaymentTotals.Paid * ISNULL(dbo.Orders.PercentPriceCommissionBase, 0) * ISNULL(dbo.Commissions.CommissionPercent, 0) 
                         - dbo.ViewPaidCommissionsTotals.PaidCommissionInEuro AS DueCommission, dbo.ViewPaymentTotals.Outstanding AS OutstandingPayments, dbo.Suppliers.IsPrincipale
FROM            dbo.Inquiries INNER JOIN
                         Person.PersonLanguages ON dbo.Inquiries.ResponsibleEngineerID = Person.PersonLanguages.PersonLanguageId INNER JOIN
                         dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID INNER JOIN
                         dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                         dbo.InquiryTypes ON dbo.Inquiries.InquiryTypeID = dbo.InquiryTypes.ID INNER JOIN
                         dbo.ProjectTypes ON dbo.Inquiries.ProjectTypeID = dbo.ProjectTypes.ID INNER JOIN
                         dbo.OrdersChance ON dbo.Inquiries.OrderChanceID = dbo.OrdersChance.ID INNER JOIN
                         dbo.Projects ON dbo.Inquiries.ProjectID = dbo.Projects.ID LEFT OUTER JOIN
                         dbo.LostReasons INNER JOIN
                         dbo.Losts ON dbo.LostReasons.ID = dbo.Losts.LostReasonID ON dbo.Inquiries.InquiryNumber = dbo.Losts.InquiryNumber LEFT OUTER JOIN
                         dbo.Orders ON dbo.Inquiries.InquiryNumber = dbo.Orders.InquiryNumber LEFT OUTER JOIN
                         dbo.Commissions ON dbo.Inquiries.InquiryNumber = dbo.Commissions.InquiryNumber LEFT OUTER JOIN
                         dbo.ViewPaymentTotals ON dbo.Orders.InquiryNumber = dbo.ViewPaymentTotals.InquiryNumber LEFT OUTER JOIN
                         dbo.view_SubViewCommissionAmounts ON dbo.Commissions.InquiryNumber = dbo.view_SubViewCommissionAmounts.InquiryNumber LEFT OUTER JOIN
                         dbo.ViewPaidCommissionsTotals ON dbo.Commissions.InquiryNumber = dbo.ViewPaidCommissionsTotals.InquiryNumber
WHERE        (dbo.Inquiries.BranchID = 1) AND (dbo.Inquiries.ParentInquiryNumber IS NULL)
