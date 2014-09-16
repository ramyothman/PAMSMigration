CREATE PROCEDURE [dbo].[GetFullEmployeesWorkLoadOrderAll]
	-- Add the parameters for the stored procedure here
	@ResponsibleEngineerId as int = null,
	@BranchID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@ResponsibleEngineerId is null)
	begin
		Select * From ViewFullEmployeeWorkLoadOrderAll where BranchID = @BranchID
	end
	else
	begin
		Select * From ViewFullEmployeeWorkLoadOrderAll Where ResponsibleEngineerId = @ResponsibleEngineerId and BranchID = @BranchID
	end
	-- Insert statements for procedure here
	
END
