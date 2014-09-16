-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetUserRoles]
(
	-- Add the parameters for the function here
	@UserID int
)
RETURNS nvarchar(500)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result nvarchar(500)
	Declare @RoleName nvarchar(50)
	Declare @MaxID int
	Declare @TempID int
	Declare @IsFirst bit
	Set @IsFirst = 1
	Set @Result = ''
	-- Add the T-SQL statements to compute the return value here
	SELECT @TempID = Max(ID) From UserRoles Where UserID = @UserID
	while (@TempID is not null)
	begin
		Select @MaxID =  RoleID From UserRoles Where ID = @TempID
		Select @RoleName = [Name] From Roles Where ID = @MaxID
		if(@RoleName is not null)
		begin
			if(@IsFirst = 0)
			begin
				Set @Result = @Result + ' - '
			end
			Set @IsFirst  = 0
			Set @Result = @Result + @RoleName
		end
		SELECT @TempID = Max(ID) From UserRoles Where UserID = @UserID AND ID < @TempID
	end
	-- Return the result of the function
	RETURN @Result
END
