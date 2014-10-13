/****** Object:  View [dbo].[new_ViewSubCommissionGraph]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW dbo.new_ViewSubCommissionGraph
AS
SELECT DISTINCT 
                      dbo.SubViewCommissionsTotals.InquiryNumber, dbo.Inquiries.CustomerID, dbo.Customers.CompanyName AS CustomerName, dbo.Inquiries.SupplierID, dbo.Suppliers.SupplierName, 
                      dbo.Orders.Delivered, dbo.Orders.DeliveredON AS DeliveredDate, dbo.Orders.OrderDate, dbo.SubViewCommissionsTotals.CommissionAmount, 
                      dbo.SubViewCommissionsTotals.PaidCommissionAmount, dbo.SubViewCommissionsTotals.RemainingCommissionAmount, dbo.SubViewCommissionsTotals.CommissionPaymentDate, 
                      dbo.Orders.ExpansionDeliveryDate, dbo.OrderStatus.Name AS OrderStatus, dbo.Inquiries.BranchID, dbo.Customers.CompanyCode
FROM         dbo.SubViewCommissionsTotals INNER JOIN
                      dbo.Inquiries ON dbo.SubViewCommissionsTotals.InquiryNumber = dbo.Inquiries.InquiryNumber INNER JOIN
                      dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID INNER JOIN
                      dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                      dbo.Commissions ON dbo.Inquiries.InquiryNumber = dbo.Commissions.InquiryNumber INNER JOIN
                      dbo.Orders ON dbo.Inquiries.InquiryNumber = dbo.Orders.InquiryNumber INNER JOIN
                      dbo.OrderStatus ON dbo.Orders.OrderStatusID = dbo.OrderStatus.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'new_ViewSubCommissionGraph';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'          DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1995
         Width = 1995
         Width = 1575
         Width = 1500
         Width = 1500
         Width = 1995
         Width = 1995
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'new_ViewSubCommissionGraph';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[6] 3) )"
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
         Top = -71
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SubViewCommissionsTotals"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Inquiries"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 246
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 117
               Left = 416
               Bottom = 237
               Right = 604
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Suppliers"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 366
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Commissions"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 486
               Right = 281
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 486
               Left = 38
               Bottom = 606
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderStatus"
            Begin Extent = 
               Top = 6
               Left = 306
               Bottom = 111
               Right = 466
            End
  ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'new_ViewSubCommissionGraph';

