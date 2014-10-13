CREATE VIEW dbo.viewSubProjectTotals
AS
SELECT     *
FROM         (SELECT     GetAllInquiries.CustomerID, GetAllInquiries.SupplierID, GetAllInquiries.InquiryStatus AS OfferStatus, Customers.CompanyName, Customers.CompanyCode, Suppliers.SupplierName, 
                                              Orders.OrderDate, Orders.DeliveredON, Orders.Delivered, GetAllInquiries.InquiryDate, Orders.PriceInEuro, GetAllInquiries.QuotationPriceInEuro, Losts.ModifiedDate AS LostDate, 
                                              Orders.OrderStatusID, OrderStatus.Name AS OrderStatus, GetAllInquiries.OfferDate, Losts.LostReasonID, LostReasons.ReasonName, LostReasons.ReasonCode AS LostReasonCode, 
                                              GetAllInquiries.InquiryNumber, GetAllInquiries.InquiryTypeID, GetAllInquiries.InquiryStatusID, InquiryStatus.Name AS InquiryStatusName, Orders.IsSubOrder, 
                                              GetAllInquiries.ProductTypeID, GetAllInquiries.IsSubOffer, PartialShipment.ShipmentDate, PartialShipment.PriceInEuro AS ShipmentPriceInEuro, Orders.BackLog, Suppliers.IsPrincipale, 
                                              Suppliers.HasSubSuppliers, GetAllInquiries.ProjectTypeID, GetAllInquiries.InquiryType, GetAllInquiries.ProjectStatus AS InquiryStatus, Orders.CompletedGoodsPaidON, 
                                              Orders.IsCompletedGoodsPaid, GetAllInquiries.BranchID, SupplierBranch.BranchID SupplierBranchID, Suppliers.IsGeneral, CompletedProjects.ModifiedDate AS CompletedOn, 
                                              [dbo].[GetTotalGoodsPaid](GetAllInquiries.InquiryNumber) PaidAmountInEuro, Row_Number() OVER (PARTITION BY GetAllInquiries.InquiryNumber
                       ORDER BY GetAllInquiries.InquiryNumber) AS row
FROM         LostReasons RIGHT OUTER JOIN
                      Losts ON LostReasons.ID = Losts.LostReasonID RIGHT OUTER JOIN
                      CompletedProjects RIGHT OUTER JOIN
                      GetAllInquiries ON CompletedProjects.InquiryNumber = GetAllInquiries.InquiryNumber LEFT OUTER JOIN
                      PartialShipment ON GetAllInquiries.InquiryNumber = PartialShipment.InquiryNumber LEFT OUTER JOIN
                      InquiryStatus ON GetAllInquiries.InquiryStatusID = InquiryStatus.ID ON Losts.InquiryNumber = GetAllInquiries.InquiryNumber LEFT OUTER JOIN
                      Customers ON GetAllInquiries.CustomerID = Customers.CustomerID LEFT OUTER JOIN
                      Suppliers ON GetAllInquiries.SupplierID = Suppliers.SupplierID LEFT OUTER JOIN
                      Orders ON GetAllInquiries.InquiryNumber = Orders.InquiryNumber LEFT OUTER JOIN
                      OrderStatus ON Orders.OrderStatusID = OrderStatus.ID INNER JOIN
                      SupplierBranch ON Suppliers.SupplierID = SupplierBranch.SupplierID) AS t
--WHERE     t .row = 1

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[15] 4[22] 2[46] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -1440
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 43
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3570
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'viewSubProjectTotals';




GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'viewSubProjectTotals';

