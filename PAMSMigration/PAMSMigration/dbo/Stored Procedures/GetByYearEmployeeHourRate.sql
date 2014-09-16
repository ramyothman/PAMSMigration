-- =============================================
-- Author:		<Author,,Name>
-- Alter date: <Alter Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByYearEmployeeHourRate]	
	@Year int,
	@BranchID int
	AS
BEGIN
	SELECT*
  FROM [dbo].[EmployeeHourRate]
  where [Year] = @Year and BranchID = @BranchID
END
