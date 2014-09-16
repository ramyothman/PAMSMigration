/****** Object:  View [dbo].[GetAllProjects]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW dbo.GetAllProjects
AS
SELECT     dbo.Projects.ID, dbo.Projects.ProjectCode, dbo.Projects.ProjectName, dbo.Projects.ProjectLocation, dbo.Projects.ProjectDescription, dbo.Projects.ContactTitle, dbo.Projects.ContactName, 
                      dbo.Projects.ContactHomePhone, dbo.Projects.ContactWorkPhone, dbo.Projects.ContactMobile, dbo.Projects.ContactEmail, dbo.Projects.ContactAddress, dbo.Projects.ContactCountry, 
                      dbo.Projects.ContactCity, dbo.Projects.ContactZip, dbo.Projects.ContactFax, dbo.Projects.UserName, dbo.Projects.ModifiedDate, dbo.Projects.FinalProduct, dbo.Projects.StartDate, 
                      dbo.Projects.EstimatedCost, dbo.Projects.EstimatedCostCurrencyID, dbo.Projects.Shareholders, dbo.Projects.LicenseBy, dbo.Projects.EngineeringBy, dbo.Projects.ProcurementBy, 
                      dbo.Projects.Contractor, dbo.Projects.EPC, dbo.Projects.VendorlistBy, dbo.Currencies.CurrencyCode, dbo.Currencies.CurrencyName, dbo.Projects.ProjectStatusID, 
                      dbo.ProjectsStatuses.ProjectStatus, dbo.Projects.ContactPosition, dbo.Projects.ContactCompany, dbo.Projects.OwnerID, Customers_3.CompanyCode, Customers_3.CompanyWebSite, '' AS Address, 
                      '' AS CountryRegionCode, CAST(1 AS bit) AS MainAddress, '' AS City, '' AS AddressTypeName, '' AS ZipCode, '' AS PostalCode, 0 AS InquiryCount, 0 AS OfferCount, 0 AS OrderCount, 
                      0 AS GoodsDeliveredCount, 0 AS GoodsPaidCount, 0 AS CompletedCount, 0 AS LostCount, 0 AS RegretCount, 0 AS CancelledCount, 0 AS LateResponseCount, dbo.Projects.EngineeringByID, 
                      Customers_1.CompanyCode AS EngineeringByCode, Customers_1.CompanyName AS EngineeringByName, dbo.Projects.ProcurementByID, dbo.Customers.CompanyCode AS ProcurementByCode, 
                      dbo.Customers.CompanyName AS ProcurementName, dbo.Projects.ContractorID, Customers_2.CompanyCode AS ContractorByCode, Customers_2.CompanyName AS ContractorByName, 
                      dbo.Projects.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, 
                      dbo.Projects.IsGeneral, dbo.Projects.IsOwnerRegistered
FROM         dbo.Projects LEFT OUTER JOIN
                      dbo.Customers AS Customers_2 ON Customers_2.CustomerID = dbo.Projects.ContractorID INNER JOIN
                      dbo.ProjectsStatuses ON dbo.Projects.ProjectStatusID = dbo.ProjectsStatuses.ID INNER JOIN
                      dbo.CompanyBranches ON dbo.Projects.BranchID = dbo.CompanyBranches.ID LEFT OUTER JOIN
                      dbo.CompanyCountries ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID LEFT OUTER JOIN
                      dbo.Customers ON dbo.Projects.ProcurementByID = dbo.Customers.CustomerID LEFT OUTER JOIN
                      dbo.Customers AS Customers_1 ON dbo.Projects.EngineeringByID = Customers_1.CustomerID LEFT OUTER JOIN
                      dbo.Customers AS Customers_3 ON dbo.Projects.OwnerID = Customers_3.CustomerID LEFT OUTER JOIN
                      dbo.Currencies ON dbo.Projects.EstimatedCostCurrencyID = dbo.Currencies.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[31] 2[5] 3) )"
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
         Top = -203
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Projects"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 27
         End
         Begin Table = "Customers_2"
            Begin Extent = 
               Top = 6
               Left = 289
               Bottom = 126
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProjectsStatuses"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 246
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CompanyBranches"
            Begin Extent = 
               Top = 126
               Left = 236
               Bottom = 246
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 32
         End
         Begin Table = "CompanyCountries"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 366
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 246
               Left = 236
               Bottom = 366
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "Customers_1"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 486
               Right = 226
       ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllProjects';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'     End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customers_3"
            Begin Extent = 
               Top = 366
               Left = 264
               Bottom = 486
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Currencies"
            Begin Extent = 
               Top = 486
               Left = 38
               Bottom = 606
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
         Column = 3825
         Alias = 3900
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllProjects';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GetAllProjects';

