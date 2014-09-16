-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	used in time sheet managements
-- =============================================
CREATE FUNCTION [dbo].[GetTotalHoursOfJobsPrincipal]
(
	@Year int,
	@SupplierID int, 
	@BranchID int
)
RETURNS decimal(18,2)
AS
BEGIN
	declare @Result decimal(18,2)
	
	set @Result = ROUND(((select Sum (Minutes) 
	             from TimeSheetDetails INNER JOIN
                      ViewShotecProject ON TimeSheetDetails.InquiryNumber =
                       ViewShotecProject.ProjectSerialNumber COLLATE Arabic_CI_AI INNER JOIN
                      TimeSheet ON TimeSheetDetails.SheetID = TimeSheet.ID 
                      where ViewShotecProject.BranchID = @BranchID and ViewShotecProject.SupplierID = @SupplierID and 
                      Year(TimeSheet.SheetDate) = @Year)/(60 * 1.0)),2)
                     
	if(@Result is null)
	   set @Result = 0
	return @Result
END
