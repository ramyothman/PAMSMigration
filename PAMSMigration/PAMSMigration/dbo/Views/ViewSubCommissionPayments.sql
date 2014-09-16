CREATE VIEW dbo.ViewSubCommissionPayments
AS
SELECT     dbo.Commissions.InquiryNumber, CASE WHEN SUM(dbo.CommissionPayments.PaidCommissionAmountInEuro) IS NULL 
                      THEN 0 ELSE SUM(dbo.CommissionPayments.PaidCommissionAmountInEuro) END AS PaidCommissionAmount, dbo.Commissions.CommissionAmountInEuro AS CommissionAmount, 
                      dbo.CommissionPayments.ONDate AS CommissionPaymentDate, dbo.Commissions.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, 
                      dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, dbo.CommissionPayments.IsPaid, SUM(ISNULL(dbo.Orders.PriceInEuro, 0) 
                      * ISNULL(dbo.Orders.PercentPriceCommissionBase, 0) * ISNULL(dbo.Commissions.CommissionPercent, 0) - dbo.GetSumJobCommissionTransactions(dbo.Orders.InquiryNumber)) 
                      AS RemainCommission
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.Commissions ON dbo.CompanyBranches.ID = dbo.Commissions.BranchID INNER JOIN
                      dbo.Orders ON dbo.Commissions.InquiryNumber = dbo.Orders.InquiryNumber LEFT OUTER JOIN
                      dbo.CommissionPayments ON dbo.CommissionPayments.InquiryNumber = dbo.Commissions.InquiryNumber
GROUP BY dbo.Commissions.InquiryNumber, dbo.Commissions.CommissionAmountInEuro, dbo.CommissionPayments.ONDate, dbo.Commissions.BranchID, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, dbo.CommissionPayments.IsPaid

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[14] 4[47] 2[5] 3) )"
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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CompanyCountries"
            Begin Extent = 
               Top = 0
               Left = 284
               Bottom = 120
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CompanyBranches"
            Begin Extent = 
               Top = 147
               Left = 0
               Bottom = 267
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Commissions"
            Begin Extent = 
               Top = 129
               Left = 283
               Bottom = 249
               Right = 542
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "CommissionPayments"
            Begin Extent = 
               Top = 78
               Left = 789
               Bottom = 198
               Right = 1058
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 205
               Left = 647
               Bottom = 325
               Right = 890
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
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 3015
         Width = 2640
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begi', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ViewSubCommissionPayments';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'n CriteriaPane = 
      Begin ColumnWidths = 12
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ViewSubCommissionPayments';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ViewSubCommissionPayments';

