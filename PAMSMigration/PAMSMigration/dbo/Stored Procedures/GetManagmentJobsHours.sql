-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetManagmentJobsHours]
@BranchID int
	
AS
BEGIN
	SELECT DISTINCT 
                      ViewShotecProject.ShotecNo, ViewShotecProject.SupplierName, ViewShotecProject.OrderPriceInEuro, ViewShotecProject.ProjectStatus, 
                      ViewShotecProject.QuotationPriceInEuro, ViewShotecProject.ResponsibleEngineer, YEAR(TimeSheet.SheetDate) AS Date, TimeSheet.BranchID, ROUND
                          ((SELECT     SUM(Minutes) AS Expr1
                              FROM          TimeSheetDetails,TimeSheet t1
                              WHERE     t1.ID = TimeSheetDetails.SheetID and 
                                        Year(t1.SheetDate) = YEAR(TimeSheet.SheetDate) and 
                                        (InquiryNumber COLLATE SQL_Latin1_General_CP1_CI_AS = ViewShotecProject.ProjectSerialNumber)) / (60 * 1.0), 2) AS Hours, 
                      SUM(TimeSheetDetails_1.Cost) AS Cost, CompanyBranches.BranchNameFL
FROM         TimeSheetDetails AS TimeSheetDetails_1 INNER JOIN
                      ViewShotecProject ON TimeSheetDetails_1.InquiryNumber = ViewShotecProject.ProjectSerialNumber COLLATE Arabic_CI_AI INNER JOIN
                      TimeSheet ON TimeSheetDetails_1.SheetID = TimeSheet.ID INNER JOIN
                      CompanyBranches ON TimeSheet.BranchID = CompanyBranches.ID
 where TimeSheet.BranchID = @BranchID                      
 Group by ViewShotecProject.ShotecNo, ViewShotecProject.SupplierName,CompanyBranches.BranchNameFL, TimeSheet.BranchID,
	      ViewShotecProject.OrderPriceInEuro, ViewShotecProject.ProjectStatus, ViewShotecProject.ProjectSerialNumber,
          ViewShotecProject.QuotationPriceInEuro, ViewShotecProject.ResponsibleEngineer,Year(TimeSheet.SheetDate) 
 Order by ShotecNo
END
