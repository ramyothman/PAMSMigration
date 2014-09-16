-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetManagmentTotalHours]
@BranchID int
	
AS
BEGIN
declare @TotalCost decimal(18,2)
create table #tempTable 
(SupplierID int,SupplierName nvarchar(50), Date int,Cost decimal(18,2),
SupplierHours decimal(18,2),JobsHours decimal(18,2),BranchID int, BranchNameFL nvarchar(50))
create table #tempTable1 
(SupplierID int,SupplierName nvarchar(50), Date int,Cost decimal(18,2),CostPercent decimal(18,4),
SupplierHours decimal(18,2),JobsHours decimal(18,2),BranchID int, BranchNameFL nvarchar(50))
insert into #tempTable
SELECT DISTINCT 
                      TimeSheetDetails.SupplierID, Suppliers.SupplierName, YEAR(TimeSheet.SheetDate) AS Date, SUM(TimeSheetDetails.Cost) AS Cost, 
                      SUM(TimeSheetDetails.Minutes / CONVERT(decimal(18, 2), 60)) AS SupplierHours, 0 AS JobsHours, TimeSheet.BranchID, CompanyBranches.BranchNameFL
FROM         TimeSheetDetails INNER JOIN
                      Suppliers ON TimeSheetDetails.SupplierID = Suppliers.SupplierID INNER JOIN
                      TimeSheet ON TimeSheetDetails.SheetID = TimeSheet.ID INNER JOIN
                      CompanyBranches ON TimeSheet.BranchID = CompanyBranches.ID
where  TimeSheetDetails.SupplierID is not null and TimeSheet.BranchID = @BranchID
Group by TimeSheetDetails.SupplierID, Suppliers.SupplierName,  Year(TimeSheet.SheetDate),TimeSheet.BranchID, CompanyBranches.BranchNameFL
insert into #tempTable
SELECT DISTINCT 
                      ViewShotecProject.SupplierID, ViewShotecProject.SupplierName, YEAR(TimeSheet.SheetDate) AS Date, SUM(TimeSheetDetails.Cost) AS Cost, 0 AS SupplierHours, 
                      SUM(TimeSheetDetails.Minutes / CONVERT(decimal(18, 2), 60)) AS JobsHours, TimeSheet.BranchID, CompanyBranches.BranchNameFL
FROM         TimeSheetDetails INNER JOIN
                      ViewShotecProject ON TimeSheetDetails.InquiryNumber = ViewShotecProject.ProjectSerialNumber COLLATE Arabic_CI_AI INNER JOIN
                      TimeSheet ON TimeSheetDetails.SheetID = TimeSheet.ID INNER JOIN
                      CompanyBranches ON TimeSheet.BranchID = CompanyBranches.ID
WHERE     (TimeSheetDetails.SupplierID IS NULL) and TimeSheet.BranchID = @BranchID
GROUP BY ViewShotecProject.SupplierID, ViewShotecProject.SupplierName, YEAR(TimeSheet.SheetDate),TimeSheet.BranchID, CompanyBranches.BranchNameFL
select @TotalCost = SUM(Cost) from #tempTable
insert into #tempTable1
select SupplierID,SupplierName, Date,SUM(Cost) as Cost, CONVERT(decimal(18,4),SUM(Cost)/@TotalCost) CostPercent, SUM(SupplierHours) SupplierHours, SUM(JobsHours) JobsHours, BranchID, BranchNameFL
from #tempTable
group by SupplierID,SupplierName,Date,BranchID, BranchNameFL
select *,(SupplierHours + JobsHours) TotalHours
from #tempTable1
DROP table #tempTable
Drop table #tempTable1
END
