﻿CREATE VIEW [dbo].[ViewShotecProjectYearlyHistory]
AS
SELECT     dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectSerialNumber, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ShotecNo, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ResponsibleEngineer, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ClientName, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ClientWebsite, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ClientInquiryNumber, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.InquiryDate, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectStatus, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.InquiryTypeID, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.SupplierName, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.SupplierQuotationNumber, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.QuotationPrice, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.QuotationCurrency, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.QuotationRateToEURO, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.QuotationRateDate, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.QuotationPriceInEuro, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.BidDueDate, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OnHold, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ModifiedDate, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.UserName, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectName, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectLocation, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectOwnerName, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectDescription, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProductName, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.CategoryName, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProductDescription, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectComment, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ReasonName, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostReasonID, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostWinnerName, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostWinnerPrice, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostWinnerPriceInEuro, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostWinnerRateToEuro, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostWinnerRateDate, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostWinnerPriceCurrencyID, 
                      ISNULL(dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ShotecOrderNumber, '') AS ShotecOrderNumber, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.CustomerOrderNumber, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.SupplierOrderNumber, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.DeliveryTime, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.DeliveredON, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.Delivered, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ExpectedDeliveryDate, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.PaymentTypeID, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.PriceBaseID, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderPrice, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderCurrencyID, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderRateToEuro, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderRateDate, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderPriceInEuro, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderDate, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderPriceCommissionBase, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderPercentPriceCommissionBase, 
                      dbo.CommissionsYearlyHistory.PriceCommissionBase AS CommPriceCommissionBase, 
                      dbo.CommissionsYearlyHistory.PercentPriceCommissionBase AS CommPercentPriceCommissionBase, dbo.CommissionsYearlyHistory.CommissionPercent, 
                      dbo.CommissionsYearlyHistory.CommissionAmount, dbo.CommissionsYearlyHistory.CurrencyID AS CommissionCurrencyID, 
                      dbo.CommissionsYearlyHistory.RateToEuro AS CommissionRateToEuro, dbo.CommissionsYearlyHistory.ONDate AS CommissionRateDate, 
                      dbo.CommissionsYearlyHistory.CommissionAmountInEuro, dbo.Banks.BankName, dbo.CommissionsYearlyHistory.Paid AS CommissionPaid, 
                      dbo.CommissionsYearlyHistory.MinPriceCommissionBase, dbo.CommissionsYearlyHistory.MinPercentPriceCommissionBase, 
                      dbo.CommissionsYearlyHistory.MinCommissionAmount, dbo.CommissionsYearlyHistory.MinPercentCommissionAmount, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.InquiryStatus, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderStatus, 
                      CAST(ISNULL(dbo.view_SubViewCommissionAmountsYearlyHistory.PaidCommissionAmount, 0) AS decimal(18, 2)) AS PaidCommissionAmount, 
                      CAST(ISNULL(dbo.view_SubViewCommissionAmountsYearlyHistory.RemainingCommissionAmount, 0) AS decimal(18, 2)) AS RemainingCommissionAmount, 
                      CAST((CASE WHEN CommissionsYearlyHistory.InquiryNumber IS NULL THEN 0 ELSE 1 END) AS Bit) AS HasCommission, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.SupplierID, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostDate, 
                      dbo.GetPrevState(dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectSerialNumber, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectTypeID) AS PrevState, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OfferDate, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ParentInquiryNumber, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ParentOrderNumber, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.IsSubOrder, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.IsSubOffer, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.IsSubLost, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostParentInquiryNumber, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.CustomerID, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostComment, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProductType, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProductTypeID, 
                      dbo.GetInquiryOutStandingPayment(dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectSerialNumber) AS OutStandingPayment, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderPercentage, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostPercentage, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.CancelledPercentage, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LateResponsePercentage, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.BackLog, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectTypeID, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderChanceID, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderChance, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.CompletedGoodsPaidON, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.IsCompletedGoodsPaid, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.HasCommission AS Expr1, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.IsAllGuranteesClosed, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.GuaranteesClosedDate, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.IsAllCommissionPaid, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.AllCommssionPaidDate, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.InquiryHasGuarantee, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.CompanyCode, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderHasGuarantee, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderStatusID, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectID, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.InquiryType, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.QuotationCurrencyCode, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostWinnerPriceCurrencyCode, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.PriceBaseCode, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.PaymentType, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.OrderCurrencyCode, dbo.Currencies.CurrencyCode AS CommissionCurrency, 
                      dbo.CommissionsYearlyHistory.BankID, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LanguageId, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ResponsibleEngineerID, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.LostReasonCode, dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.Year, 
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.BranchID
FROM         dbo.Currencies INNER JOIN
                      dbo.CommissionsYearlyHistory ON dbo.Currencies.ID = dbo.CommissionsYearlyHistory.CurrencyID LEFT OUTER JOIN
                      dbo.view_SubViewCommissionAmountsYearlyHistory ON 
                      dbo.CommissionsYearlyHistory.InquiryNumber = dbo.view_SubViewCommissionAmountsYearlyHistory.InquiryNumber RIGHT OUTER JOIN
                      dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory ON 
                      dbo.CommissionsYearlyHistory.InquiryNumber = dbo.ViewProjectInquiryLostOrderDeliveredCompletedYearlyHistory.ProjectSerialNumber LEFT OUTER JOIN
                      dbo.Banks ON dbo.CommissionsYearlyHistory.BankID = dbo.Banks.ID
