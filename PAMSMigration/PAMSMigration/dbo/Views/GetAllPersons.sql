CREATE VIEW dbo.GetAllPersons
AS
SELECT     Person.Person.NameStyle, Person.Person.EmailPromotion, Person.Person.RowGuid, Person.Person.ModifiedDate, Person.Person.CreatedDate, 
                      Person.PersonType.PersonPersonTypesId AS PersonTypeID, Person.PersonPersonTypes.Name AS PersonType, dbo.GetAllPersonsMails.EmailAddressId, 
                      dbo.GetAllPersonsMails.EmailAddressTypeId, dbo.GetAllPersonsMails.Email, dbo.GetAllPersonsMails.EmailVerified, dbo.GetAllPersonsMails.EmailVerificationHash, 
                      dbo.GetAllPersonsMails.EmailAddressTypeName, dbo.GetAllPersonsMails.MainEmailAddress, dbo.GetAllPersonsAddresses.BusinessEntityAddressId, dbo.GetAllPersonsAddresses.AddressId, 
                      dbo.GetAllPersonsAddresses.Address, dbo.GetAllPersonsAddresses.CountryRegionCode, dbo.GetAllPersonsAddresses.City, dbo.GetAllPersonsAddresses.StateProvinceId, 
                      dbo.GetAllPersonsAddresses.PostalCode, dbo.GetAllPersonsAddresses.ZipCode, dbo.GetAllPersonsAddresses.SpatialLocation, dbo.GetAllPersonsAddresses.StateProvinceCode, 
                      dbo.GetAllPersonsAddresses.StateProvinceName, dbo.GetAllPersonsAddresses.AddressTypeId, dbo.GetAllPersonsAddresses.AddressTypeName, dbo.GetAllPersonsAddresses.MainAddress, 
                      dbo.GetAllPersonsPhones.PhoneNumber, dbo.GetAllPersonsPhones.PhoneNumberTypeId, dbo.GetAllPersonsPhones.PhoneVerified, dbo.GetAllPersonsPhones.PhoneVerificationCode, 
                      dbo.GetAllPersonsPhones.PhoneNumberTypeName, dbo.GetAllPersonsPhones.MainPhone, dbo.GetAllPersonsPhones.PersonPhoneId, Person.PersonLanguages.PersonLanguageId, 
                      Person.PersonLanguages.LanguageId, Person.PersonLanguages.Title, Person.PersonLanguages.FirstName, Person.PersonLanguages.MiddleName, Person.PersonLanguages.LastName, 
                      Person.PersonLanguages.Suffix, Person.PersonLanguages.DisplayName, dbo.GetAllPersonExtra.NationalityCode, dbo.GetAllPersonExtra.Gender, dbo.GetAllPersonExtra.Religion, 
                      dbo.GetAllPersonExtra.BirthDate, dbo.GetAllPersonExtra.BirthPlace, dbo.GetAllPersonExtra.MaritalStatus, dbo.GetAllPersonExtra.SpauseName, dbo.GetAllPersonExtra.EmergencyContactName, 
                      dbo.GetAllPersonExtra.EmergencyContactAddress, dbo.GetAllPersonExtra.EmergencyContactNumber, dbo.GetAllPersonExtra.EmergencyContactEmail, dbo.GetAllPersonExtra.HireDate, 
                      dbo.GetAllPersonExtra.LeaveDate, dbo.GetAllPersonExtra.IsResponsibleEngineer, dbo.GetAllPersonExtra.Position, dbo.GetAllPersonExtra.Salary, dbo.GetAllPersonExtra.SalaryCurrencyID, 
                      dbo.GetAllPersonExtra.ManagerId, dbo.GetAllPersonExtra.OfferApprove, dbo.GetAllPersonExtra.OfferPrepare, dbo.GetAllPersonExtra.SalaryCurrencyCode, dbo.GetAllPersonExtra.OtherInformation, 
                      dbo.GetAllPersonExtra.SalaryCurrencyName, Person.Person.BusinessEntityId, dbo.GetAllPersonExtra.NumOfVacation, Person.Person.IsActive, dbo.GetAllPersonExtra.EmployeeTypeID, 
                      dbo.GetAllPersonExtra.EmployeeTypeName, dbo.GetAllPersonsAddresses.CityID, PB.BranchID, dbo.GetAllPersonExtra.BranchNameFL, dbo.GetAllPersonExtra.CountryID, 
                      dbo.GetAllPersonExtra.CountryName, Person.PersonLanguages.AcronymName
FROM         dbo.GetAllPersonExtra INNER JOIN
                      Person.Person INNER JOIN
                      Person.PersonType ON Person.Person.BusinessEntityId = Person.PersonType.BusinessEntityId INNER JOIN
                      Person.PersonPersonTypes ON Person.PersonType.PersonPersonTypesId = Person.PersonPersonTypes.PersonPersonTypesId INNER JOIN
                      Person.PersonLanguages ON Person.Person.BusinessEntityId = Person.PersonLanguages.PersonId ON dbo.GetAllPersonExtra.PersonID = Person.Person.BusinessEntityId LEFT OUTER JOIN
                      dbo.GetAllPersonsPhones ON Person.Person.BusinessEntityId = dbo.GetAllPersonsPhones.BusinessEntityId LEFT OUTER JOIN
                      dbo.GetAllPersonsAddresses ON Person.Person.BusinessEntityId = dbo.GetAllPersonsAddresses.BusinessEntityId LEFT OUTER JOIN
                      dbo.GetAllPersonsMails ON Person.Person.BusinessEntityId = dbo.GetAllPersonsMails.BusinessEntityId INNER JOIN
                      dbo.PersonsBranches AS PB ON PB.PersonID = Person.Person.BusinessEntityId

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[45] 2[5] 3) )"
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
         Begin Table = "Person (Person)"
            Begin Extent = 
               Top = 0
               Left = 781
               Bottom = 270
               Right = 1026
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PersonType (Person)"
            Begin Extent = 
               Top = 164
               Left = 1064
               Bottom = 284
               Right = 1258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PersonPersonTypes (Person)"
            Begin Extent = 
               Top = 81
               Left = 427
               Bottom = 241
               Right = 695
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PersonLanguages (Person)"
            Begin Extent = 
               Top = 247
               Left = 39
               Bottom = 367
               Right = 303
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "GetAllPersonsPhones"
            Begin Extent = 
               Top = 40
               Left = 1065
               Bottom = 160
               Right = 1272
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "GetAllPersonsAddresses"
            Begin Extent = 
               Top = 94
               Left = 254
               Bottom = 214
               Right = 461
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "GetAllPersonsMails"
            Begin Extent = 
               Top = 486
               Left = 38
      ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllPersons';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'         Bottom = 606
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PB"
            Begin Extent = 
               Top = 62
               Left = 906
               Bottom = 307
               Right = 1066
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GetAllPersonExtra"
            Begin Extent = 
               Top = 0
               Left = 25
               Bottom = 159
               Right = 244
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
         Column = 2070
         Alias = 1395
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllPersons';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllPersons';

