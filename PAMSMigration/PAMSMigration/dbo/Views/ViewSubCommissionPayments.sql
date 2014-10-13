CREATE VIEW dbo.ViewSubCommissionPayments
AS
SELECT     dbo.Orders.InquiryNumber, ISNULL(SUM(dbo.CommissionPayments.PaidCommissionAmountInEuro), 0) AS PaidCommissionAmount, dbo.Orders.CommissionAmountInEuro AS CommissionAmount, 
                      dbo.CommissionPayments.ONDate AS CommissionPaymentDate, dbo.Inquiries.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, 
                      dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, dbo.CommissionPayments.IsPaid, 
                      SUM(dbo.Orders.CommissionAmountInEuro - dbo.GetSumJobCommissionTransactions(dbo.Orders.InquiryNumber)) AS RemainCommission
FROM         dbo.Inquiries INNER JOIN
                      dbo.Orders ON dbo.Inquiries.InquiryNumber = dbo.Orders.InquiryNumber INNER JOIN
                      dbo.CommissionPayments ON dbo.Orders.InquiryNumber = dbo.CommissionPayments.InquiryNumber INNER JOIN
                      dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID ON dbo.Inquiries.BranchID = dbo.CompanyBranches.ID
GROUP BY dbo.Orders.InquiryNumber, dbo.Orders.CommissionAmountInEuro, dbo.CommissionPayments.ONDate, dbo.Inquiries.BranchID, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, dbo.CommissionPayments.IsPaid

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[30] 2[18] 3) )"
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
         Top = -288
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CompanyCountries"
            Begin Extent = 
               Top = 57
               Left = 0
               Bottom = 177
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CompanyBranches"
            Begin Extent = 
               Top = 75
               Left = 283
               Bottom = 266
               Right = 537
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
         Begin Table = "CommissionPayments"
            Begin Extent = 
               Top = 302
               Left = 360
               Bottom = 422
               Right = 629
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Inquiries"
            Begin Extent = 
               Top = 36
               Left = 598
               Bottom = 156
               Right = 826
            End
            DisplayFlags = 280
            TopColumn = 34
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
         Width = 2550
         Width = 3015
         Width = 2640
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 900
         Width = 960
         Width = 1500
      End
   End
   Begin ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ViewSubCommissionPayments';










GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 4665
         Alias = 2115
         Table = 2310
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

