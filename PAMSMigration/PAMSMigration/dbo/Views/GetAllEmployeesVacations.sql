CREATE VIEW dbo.GetAllEmployeesVacations
AS
SELECT DISTINCT 
                      dbo.EmployeeVacations.EmployeeVacationID, dbo.EmployeeVacations.PersonId, dbo.EmployeeVacations.VacationTypeId, dbo.EmployeeVacations.StartDate, dbo.EmployeeVacations.EndDate, 
                      dbo.EmployeeVacations.RequestDate, dbo.EmployeeVacations.ApprovedDate, dbo.EmployeeVacations.ApprovedPersonId, dbo.EmployeeVacations.IsApproved, 
                      dbo.EmployeeVacations.ModifiedDate, dbo.EmployeeVacations.UserName, dbo.VacationTypes.VacationTypeName, dbo.EmployeeVacations.Comment, 
                      dbo.EmployeeVacations.VacationReportWayID, dbo.VacationReportWay.VacationReportWayName, dbo.GetAllPersons.DisplayName, dbo.GetAllPersons.NumOfVacation, 
                      Person.PersonLanguages.DisplayName AS ApprovedByDisplayName, YEAR(dbo.EmployeeVacations.StartDate) AS VacationYear, dbo.GetTotalEmployeeVacations(dbo.EmployeeVacations.PersonId, 
                      YEAR(dbo.EmployeeVacations.StartDate)) AS TotalDays, dbo.GetRemainEmployeeVacations(dbo.EmployeeVacations.PersonId, YEAR(dbo.EmployeeVacations.StartDate)) AS RemainDays, 
                      dbo.EmployeeVacations.NumOfDays, dbo.GetAllPersons.BranchNameFL, dbo.GetAllPersons.CountryID, dbo.GetAllPersons.CountryName, dbo.GetAllPersons.BranchID
FROM         dbo.VacationTypes INNER JOIN
                      dbo.EmployeeVacations ON dbo.VacationTypes.VacationTypeId = dbo.EmployeeVacations.VacationTypeId INNER JOIN
                      dbo.VacationReportWay ON dbo.EmployeeVacations.VacationReportWayID = dbo.VacationReportWay.ID INNER JOIN
                      dbo.GetAllPersons ON dbo.EmployeeVacations.PersonId = dbo.GetAllPersons.BusinessEntityId LEFT OUTER JOIN
                      Person.PersonLanguages ON dbo.EmployeeVacations.ApprovedPersonId = Person.PersonLanguages.PersonId
WHERE     (Person.PersonLanguages.LanguageId IS NULL) OR
                      (Person.PersonLanguages.LanguageId = 1)

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[5] 2[42] 3) )"
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
         Begin Table = "VacationTypes"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EmployeeVacations"
            Begin Extent = 
               Top = 181
               Left = 227
               Bottom = 515
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VacationReportWay"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 246
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GetAllPersons"
            Begin Extent = 
               Top = 62
               Left = 610
               Bottom = 345
               Right = 829
            End
            DisplayFlags = 280
            TopColumn = 73
         End
         Begin Table = "PersonLanguages (Person)"
            Begin Extent = 
               Top = 126
               Left = 288
               Bottom = 246
               Right = 467
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
      Begin ColumnWidths = 26
         Width = 284
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
         W', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllEmployeesVacations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'idth = 1500
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllEmployeesVacations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllEmployeesVacations';

