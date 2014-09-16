/****** Object:  View [dbo].[GetPrincipalTimeSheetDetails]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetPrincipalTimeSheetDetails]
AS
SELECT     dbo.GetAllTimeSheetDetails.Minutes, dbo.GetAllTimeSheetDetails.SheetDetailsID, dbo.GetAllTimeSheetDetails.SupplierID, dbo.GetAllTimeSheetDetails.SupplierName, 
                      dbo.GetAllTimeSheetDetails.TimePercentage, dbo.GetAllTimeSheetDetails.Cost, dbo.GetAllTimeSheets.PersonID, dbo.GetAllTimeSheets.DisplayName, 
                      dbo.GetAllTimeSheets.UserName, dbo.GetAllTimeSheets.SheetDate, dbo.GetAllTimeSheets.ModifiedDate, dbo.GetAllTimeSheets.BranchID, 
                      dbo.GetAllTimeSheets.BranchNameFL, dbo.GetAllTimeSheets.BranchNameSL, dbo.GetAllTimeSheets.CountryID, dbo.GetAllTimeSheets.CountryName
FROM         dbo.GetAllTimeSheetDetails INNER JOIN
                      dbo.GetAllTimeSheets ON dbo.GetAllTimeSheetDetails.SheetID = dbo.GetAllTimeSheets.ID
