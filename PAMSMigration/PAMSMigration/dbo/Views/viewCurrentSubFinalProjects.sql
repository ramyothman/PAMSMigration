CREATE VIEW dbo.viewCurrentSubFinalProjects
AS
SELECT DISTINCT 
                      dbo.viewSubProjectTotals.InquiryStatus, dbo.viewSubProjectTotals.CustomerID, dbo.viewSubProjectTotals.SupplierID, dbo.viewSubProjectTotals.CompanyName, 
                      dbo.viewSubProjectTotals.SupplierName, CASE WHEN InquiryStatus IN ('Inquiry') THEN InquiryDate ELSE CASE WHEN InquiryStatus IN ('Offer') 
                      THEN OfferDate ELSE CASE WHEN InquiryStatus IN ('Lost', 'Cancelled', 'Regret', 'LateResponse') 
                      THEN LostDate ELSE CASE WHEN InquiryStatus = 'Order' THEN OrderDate ELSE ShipmentDate END END END END AS InquiryDate, dbo.viewSubProjectTotals.PriceInEuro, 
                      dbo.viewSubProjectTotals.QuotationPriceInEuro, dbo.viewSubProjectTotals.OrderDate, dbo.viewSubProjectTotals.OrderStatusID, dbo.viewSubProjectTotals.OrderStatus, 
                      CASE WHEN InquiryStatus IN ('Offer', 'Lost', 'Cancelled', 'Regret', 'LateResponse') THEN QuotationPriceInEuro ELSE CASE WHEN InquiryStatus IN ('Delivered') 
                      THEN ShipmentPriceInEuro ELSE ISNULL(BackLog, 0) END END AS TotalAmount, dbo.viewSubProjectTotals.ReasonName, dbo.viewSubProjectTotals.ProductTypeID, 
                      dbo.viewSubProjectTotals.IsSubOffer, dbo.Suppliers.IsPrincipale, dbo.Suppliers.HasSubSuppliers, dbo.viewSubProjectTotals.InquiryStatusName, dbo.viewSubProjectTotals.ProjectTypeID, 
                      dbo.viewSubProjectTotals.OfferStatus, dbo.viewSubProjectTotals.InquiryType, dbo.viewSubProjectTotals.BranchID, dbo.SupplierBranch.BranchID AS SupplierBranchID, 
                      dbo.Suppliers.IsGeneral
FROM         dbo.viewSubProjectTotals INNER JOIN
                      dbo.Suppliers ON dbo.viewSubProjectTotals.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                      dbo.SupplierBranch ON dbo.Suppliers.SupplierID = dbo.SupplierBranch.SupplierID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'viewCurrentSubFinalProjects';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[5] 2[5] 3) )"
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "viewSubProjectTotals"
            Begin Extent = 
               Top = 87
               Left = 670
               Bottom = 320
               Right = 875
            End
            DisplayFlags = 280
            TopColumn = 23
         End
         Begin Table = "Suppliers"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 126
               Right = 469
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SupplierBranch"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 231
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'viewCurrentSubFinalProjects';

