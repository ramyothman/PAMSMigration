CREATE VIEW dbo.ViewCommissions
AS
SELECT     dbo.Orders.InquiryNumber, dbo.Orders.PriceCommissionBase, dbo.Orders.PercentPriceCommissionBase, dbo.Orders.CommissionPercent, dbo.Orders.CommissionAmount, 
                      dbo.Orders.CommissionRateDate AS ONDate, dbo.Orders.CommissionAmountInEuro, CAST(0 AS bit) AS Paid, dbo.Orders.UserName, dbo.Orders.ModifiedDate, dbo.Banks.BankName, 
                      dbo.fn_GetBankAccountNumber(dbo.Banks.ID) AS BankAccountNumber, dbo.Inquiries.ShotecNo, 0 AS MinPriceCommissionBase, 0 AS MinPercentPriceCommissionBase, 
                      0 AS MinCommissionAmount, 0 AS MinPercentCommissionAmount, dbo.Inquiries.SupplierID, dbo.Suppliers.SupplierName, dbo.Inquiries.CustomerID, dbo.Customers.CompanyName, 
                      dbo.Orders.CustomerOrderNumber, dbo.Orders.SupplierOrderNumber, dbo.Orders.OrderDate, dbo.Orders.Delivered, dbo.Orders.DeliveredON, dbo.Orders.PriceInEuro, 
                      dbo.Orders.Price AS OrderPrice, dbo.Orders.CurrencyID AS OrderCurrency, dbo.Orders.RateToEuro AS OrderRateToEuro, dbo.Orders.ONDate AS OrderOnDate, 
                      ISNULL(dbo.fn_GetPaidCommission(dbo.Orders.InquiryNumber), 0) AS PaidCommissionAmount, dbo.Orders.ExpansionDeliveryDate, dbo.Inquiries.BranchID, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, dbo.Customers.CompanyCode, 
                      dbo.Orders.CommissionAmountInEuro - ISNULL(dbo.GetSumJobCommissionTransactions(dbo.Orders.InquiryNumber), 0) AS RemainingCommissionAmount, 
                      dbo.Orders.CommissionCurrencyID AS CurrencyID, dbo.Orders.CommissionRateToEuro AS RateToEuro
FROM         dbo.Inquiries INNER JOIN
                      dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID INNER JOIN
                      dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                      dbo.Orders ON dbo.Inquiries.InquiryNumber = dbo.Orders.InquiryNumber INNER JOIN
                      dbo.Currencies ON dbo.Orders.CommissionCurrencyID = dbo.Currencies.ID LEFT OUTER JOIN
                      dbo.Banks ON dbo.Currencies.ID = dbo.Banks.CurrencyID LEFT OUTER JOIN
                      dbo.CompanyBranches ON dbo.Inquiries.BranchID = dbo.CompanyBranches.ID LEFT OUTER JOIN
                      dbo.CompanyCountries ON dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND 
                      dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[4] 2[41] 3) )"
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
         Begin Table = "Inquiries"
            Begin Extent = 
               Top = 164
               Left = 538
               Bottom = 284
               Right = 750
            End
            DisplayFlags = 280
            TopColumn = 1
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
               Top = 44
               Left = 787
               Bottom = 164
               Right = 975
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 20
               Left = 29
               Bottom = 263
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 27
         End
         Begin Table = "Currencies"
            Begin Extent = 
               Top = 0
               Left = 460
               Bottom = 172
               Right = 631
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Banks"
            Begin Extent = 
               Top = 201
               Left = 350
               Bottom = 321
               Right = 510
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "CompanyBranches"
            Begin Extent = 
               Top = 457
               Left = 626
               Bottom = 577
               Right = 864
            End
            Di', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ViewCommissions';




GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'splayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CompanyCountries"
            Begin Extent = 
               Top = 560
               Left = 682
               Bottom = 680
               Right = 842
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
         Width = 2955
         Width = 1500
         Width = 2205
         Width = 1500
         Width = 1500
         Width = 2250
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
         Column = 6255
         Alias = 2445
         Table = 3135
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

