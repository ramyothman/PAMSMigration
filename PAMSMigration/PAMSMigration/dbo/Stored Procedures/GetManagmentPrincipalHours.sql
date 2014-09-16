-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetManagmentPrincipalHours]
@BranchID int
	
AS
BEGIN
SELECT DISTINCT 
                      TimeSheetDetails.SupplierID, Suppliers.SupplierName, YEAR(TimeSheet.SheetDate) AS Date, SUM(TimeSheetDetails.Cost) AS Cost, 
                      SUM(TimeSheetDetails.Minutes / CONVERT(decimal(18, 2), 60)) AS SupplierHours, TimeSheet.BranchID, CompanyBranches.BranchNameFL
FROM         TimeSheetDetails INNER JOIN
                      Suppliers ON TimeSheetDetails.SupplierID = Suppliers.SupplierID INNER JOIN
                      TimeSheet ON TimeSheetDetails.SheetID = TimeSheet.ID INNER JOIN
                      CompanyBranches ON TimeSheet.BranchID = CompanyBranches.ID
where  TimeSheetDetails.SupplierID is not null and TimeSheet.BranchID = @BranchID
Group by TimeSheetDetails.SupplierID, Suppliers.SupplierName,  Year(TimeSheet.SheetDate),TimeSheet.BranchID, CompanyBranches.BranchNameFL
END
