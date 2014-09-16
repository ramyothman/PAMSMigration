CREATE FUNCTION [Migration].[mg_GetNewPersonBusinessEntityID]
(
	-- Add the parameters for the function here
	@OldID int,
	@TypeId int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int
	-- Add the T-SQL statements to compute the return value here
	if(@TypeId = 1)
		SELECT @Result = BusinessEntityId From Person.BusinessEntity where EgyptBusinessEntityID = @OldID
	Else if (@TypeId = 2)
		SELECT @Result = BusinessEntityId From Person.BusinessEntity where RPEBusinessEntityID = @OldID
	Else if (@TypeId = 3)
		SELECT @Result = BusinessEntityId From Person.BusinessEntity where QatarBusinessEntityID = @OldID
	-- Return the result of the function
	RETURN @Result
END