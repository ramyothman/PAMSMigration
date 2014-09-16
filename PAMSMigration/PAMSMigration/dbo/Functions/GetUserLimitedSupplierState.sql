-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetUserLimitedSupplierState]
(
	-- Add the parameters for the function here
	@UserId int,
	@BranchID int
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	Declare @Result bit
	Set @Result = 0
	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = LimitedSuppliers From ViewUserRoles Where Userid = @UserId AND LimitedSuppliers <> 1 and BranchID = @BranchID
	return @Result
	--if(@Result is null)
	--begin
	--	Set @Result = 1
	--end
	--else
	--begin
	--	Set @Result = 0
	--end
	---- Return the result of the function
	--RETURN @Result
END