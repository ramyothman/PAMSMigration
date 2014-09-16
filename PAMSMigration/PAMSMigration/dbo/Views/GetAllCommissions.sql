/****** Object:  View [dbo].[GetAllCommissions]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW dbo.GetAllCommissions
AS
SELECT     dbo.Commissions.InquiryNumber, dbo.Commissions.PriceCommissionBase, dbo.Commissions.PercentPriceCommissionBase, dbo.Commissions.CommissionPercent, 
                      dbo.Commissions.CommissionAmount, dbo.Commissions.CurrencyID, dbo.Commissions.RateToEuro, dbo.Commissions.ONDate, dbo.Commissions.CommissionAmountInEuro, 
                      dbo.Commissions.BankID, dbo.Commissions.Comment, dbo.Commissions.Paid, dbo.Commissions.UserName, dbo.Commissions.ModifiedDate, dbo.Commissions.MinPriceCommissionBase, 
                      dbo.Commissions.MinPercentPriceCommissionBase, dbo.Commissions.MinCommissionAmount, dbo.Commissions.MinPercentCommissionAmount, dbo.Banks.BankCode, 
                      dbo.Currencies.CurrencyCode, dbo.Commissions.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, 
                      dbo.CompanyCountries.CountryName, dbo.Commissions.CustomerPaymentID, dbo.CustomerPayments.PaidAmountInEuro, dbo.CustomerPayments.InvoiceNumber
FROM         dbo.Currencies RIGHT OUTER JOIN
                      dbo.Commissions INNER JOIN
                      dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID ON dbo.Commissions.BranchID = dbo.CompanyBranches.ID LEFT OUTER JOIN
                      dbo.CustomerPayments ON dbo.Commissions.CustomerPaymentID = dbo.CustomerPayments.CustomerPaymentID ON dbo.Currencies.ID = dbo.Commissions.CurrencyID LEFT OUTER JOIN
                      dbo.Banks ON dbo.Commissions.BankID = dbo.Banks.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[54] 4[5] 2[35] 3) )"
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
         Begin Table = "Banks"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Commissions"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 246
               Right = 281
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CompanyCountries"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 126
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CompanyBranches"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 366
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Currencies"
            Begin Extent = 
               Top = 393
               Left = 302
               Bottom = 513
               Right = 473
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CustomerPayments"
            Begin Extent = 
               Top = 123
               Left = 565
               Bottom = 243
               Right = 796
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllCommissions';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Column = 1440
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllCommissions';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllCommissions';

