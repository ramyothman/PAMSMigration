/****** Object:  View [dbo].[GetProjectTimeSheetDetails]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetProjectTimeSheetDetails]
AS
SELECT     dbo.GetAllTimeSheetDetails.SheetDetailsID, dbo.GetAllTimeSheetDetails.InquiryNumber, dbo.GetAllTimeSheetDetails.Minutes, 
                      dbo.GetAllTimeSheetDetails.SupplierID, dbo.GetAllTimeSheetDetails.SupplierName, dbo.GetAllTimeSheetDetails.ShotecNo, 
                      dbo.GetAllTimeSheetDetails.TimePercentage, dbo.GetAllTimeSheetDetails.SheetID, dbo.GetAllTimeSheets.PersonID, dbo.GetAllTimeSheets.DisplayName, 
                      dbo.GetAllTimeSheets.SheetDate, dbo.GetAllTimeSheetDetails.Cost, dbo.GetAllTimeSheets.BranchID, dbo.GetAllTimeSheets.BranchNameFL, 
                      dbo.GetAllTimeSheets.BranchNameSL, dbo.GetAllTimeSheets.CountryID, dbo.GetAllTimeSheets.CountryName
FROM         dbo.GetAllTimeSheetDetails INNER JOIN
                      dbo.GetAllTimeSheets ON dbo.GetAllTimeSheetDetails.SheetID = dbo.GetAllTimeSheets.ID
