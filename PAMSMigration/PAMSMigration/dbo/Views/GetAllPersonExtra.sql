/****** Object:  View [dbo].[GetAllPersonExtra]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW dbo.GetAllPersonExtra
AS
SELECT     Person.PersonExtra.PersonID, Person.PersonExtra.NationalityCode, Person.PersonExtra.Gender, Person.PersonExtra.Religion, Person.PersonExtra.BirthDate, Person.PersonExtra.BirthPlace, 
                      Person.PersonExtra.MaritalStatus, Person.PersonExtra.SpauseName, Person.PersonExtra.EmergencyContactName, Person.PersonExtra.EmergencyContactAddress, 
                      Person.PersonExtra.EmergencyContactNumber, Person.PersonExtra.EmergencyContactEmail, Person.PersonExtra.HireDate, Person.PersonExtra.LeaveDate, 
                      Person.PersonExtra.IsResponsibleEngineer, Person.PersonExtra.Position, Person.PersonExtra.Salary, Person.PersonExtra.SalaryCurrencyID, Person.PersonExtra.ManagerId, 
                      Person.PersonExtra.OfferApprove, Person.PersonExtra.OfferPrepare, Person.PersonExtra.OtherInformation, dbo.Currencies.CurrencyCode AS SalaryCurrencyCode, 
                      dbo.Currencies.CurrencyName AS SalaryCurrencyName, Person.PersonExtra.NumOfVacation, Person.PersonExtra.EmployeeTypeID, dbo.EmployeesTypes.EmployeeTypeName, 
                      Person.PersonExtra.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM         dbo.Currencies RIGHT OUTER JOIN
                      Person.PersonExtra INNER JOIN
                      dbo.PersonsBranches INNER JOIN
                      dbo.CompanyBranches INNER JOIN
                      dbo.CompanyCountries ON dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID ON 
                      dbo.PersonsBranches.BranchID = dbo.CompanyBranches.ID AND dbo.PersonsBranches.BranchID = dbo.CompanyBranches.ID ON 
                      Person.PersonExtra.PersonID = dbo.PersonsBranches.PersonID LEFT OUTER JOIN
                      dbo.EmployeesTypes ON Person.PersonExtra.EmployeeTypeID = dbo.EmployeesTypes.ID ON dbo.Currencies.ID = Person.PersonExtra.SalaryCurrencyID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[70] 4[5] 2[14] 3) )"
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
         Begin Table = "PersonExtra (Person)"
            Begin Extent = 
               Top = 0
               Left = 61
               Bottom = 288
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CompanyBranches"
            Begin Extent = 
               Top = 14
               Left = 446
               Bottom = 134
               Right = 684
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CompanyCountries"
            Begin Extent = 
               Top = 110
               Left = 755
               Bottom = 230
               Right = 1004
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EmployeesTypes"
            Begin Extent = 
               Top = 47
               Left = 1008
               Bottom = 137
               Right = 1194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Currencies"
            Begin Extent = 
               Top = 249
               Left = 1000
               Bottom = 369
               Right = 1171
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PersonsBranches"
            Begin Extent = 
               Top = 196
               Left = 553
               Bottom = 316
               Right = 713
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
      Begin ColumnWidths = 11
         Width = 28', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllPersonExtra';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'4
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllPersonExtra';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllPersonExtra';

