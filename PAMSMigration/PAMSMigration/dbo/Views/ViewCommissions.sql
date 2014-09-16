CREATE VIEW dbo.ViewCommissions
AS
SELECT     dbo.Commissions.InquiryNumber, dbo.Commissions.PriceCommissionBase, dbo.Commissions.PercentPriceCommissionBase, dbo.Commissions.CommissionPercent, 
                      dbo.Commissions.CommissionAmount, dbo.Commissions.CurrencyID, dbo.Commissions.RateToEuro, dbo.Commissions.ONDate, dbo.Commissions.BankID, 
                      dbo.Commissions.CommissionAmountInEuro, dbo.Commissions.Comment, dbo.Commissions.Paid, dbo.Commissions.UserName, dbo.Commissions.ModifiedDate, dbo.Banks.BankName, 
                      dbo.fn_GetBankAccountNumber(dbo.Banks.ID) AS BankAccountNumber, dbo.Inquiries.ShotecNo, dbo.Commissions.MinPriceCommissionBase, dbo.Commissions.MinPercentPriceCommissionBase, 
                      dbo.Commissions.MinCommissionAmount, dbo.Commissions.MinPercentCommissionAmount, dbo.Inquiries.SupplierID, dbo.Suppliers.SupplierName, dbo.Inquiries.CustomerID, 
                      dbo.Customers.CompanyName, dbo.Orders.CustomerOrderNumber, dbo.Orders.SupplierOrderNumber, dbo.Orders.OrderDate, dbo.Orders.Delivered, dbo.Orders.DeliveredON, 
                      dbo.Orders.PriceInEuro, dbo.Orders.Price AS OrderPrice, dbo.Orders.CurrencyID AS OrderCurrency, dbo.Orders.RateToEuro AS OrderRateToEuro, dbo.Orders.ONDate AS OrderOnDate, 
                      dbo.view_SubViewCommissionAmounts.PaidCommissionAmount, dbo.Orders.ExpansionDeliveryDate, dbo.Inquiries.BranchID, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, dbo.Customers.CompanyCode, 
                      dbo.view_SubViewCommissionAmounts.RemainCommission AS RemainingCommissionAmount
FROM         dbo.Commissions INNER JOIN
                      dbo.Currencies ON dbo.Commissions.CurrencyID = dbo.Currencies.ID INNER JOIN
                      dbo.Inquiries ON dbo.Commissions.InquiryNumber = dbo.Inquiries.InquiryNumber INNER JOIN
                      dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID INNER JOIN
                      dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                      dbo.Orders ON dbo.Commissions.InquiryNumber = dbo.Orders.InquiryNumber LEFT OUTER JOIN
                      dbo.Banks ON dbo.Commissions.BankID = dbo.Banks.ID LEFT OUTER JOIN
                      dbo.view_SubViewCommissionAmounts ON dbo.Commissions.InquiryNumber = dbo.view_SubViewCommissionAmounts.InquiryNumber LEFT OUTER JOIN
                      dbo.CompanyBranches ON dbo.Inquiries.BranchID = dbo.CompanyBranches.ID LEFT OUTER JOIN
                      dbo.CompanyCountries ON dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND 
                      dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[12] 2[29] 3) )"
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
         Top = -220
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Commissions"
            Begin Extent = 
               Top = 0
               Left = 266
               Bottom = 120
               Right = 509
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Currencies"
            Begin Extent = 
               Top = 131
               Left = 495
               Bottom = 251
               Right = 666
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Inquiries"
            Begin Extent = 
               Top = 335
               Left = 623
               Bottom = 455
               Right = 835
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 72
               Left = 1075
               Bottom = 192
               Right = 1263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Suppliers"
            Begin Extent = 
               Top = 105
               Left = 752
               Bottom = 225
               Right = 940
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 486
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Banks"
            Begin Extent = 
               Top = 366
               Left = 303
               Bottom = 486
               Right = 463
            End
            D', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ViewCommissions';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'isplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CompanyBranches"
            Begin Extent = 
               Top = 606
               Left = 38
               Bottom = 726
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CompanyCountries"
            Begin Extent = 
               Top = 486
               Left = 306
               Bottom = 606
               Right = 466
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "view_SubViewCommissionAmounts"
            Begin Extent = 
               Top = 238
               Left = 375
               Bottom = 462
               Right = 756
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
      Begin ColumnWidths = 45
         Width = 284
         Width = 1500
         Width = 3360
         Width = 1500
         Width = 1500
         Width = 2205
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
         Width = 2970
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
         Alias = 1650
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ViewCommissions';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ViewCommissions';

