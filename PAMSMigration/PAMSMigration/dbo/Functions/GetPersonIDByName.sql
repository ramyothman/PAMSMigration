-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
Create FUNCTION [dbo].[GetPersonIDByName]
(
	-- Add the parameters for the function here
	@Name nvarchar(50)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int
	-- Add the T-SQL statements to compute the return value here
	SELECT @Result =   PersonID From [Person].[PersonLanguages] where DisplayName = @Name
	-- Return the result of the function
	RETURN @Result
END
