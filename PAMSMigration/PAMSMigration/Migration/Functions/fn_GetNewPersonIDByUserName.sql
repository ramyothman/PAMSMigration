--End Products
--------------------------------------------------------------------------------
--Functions
Create FUNCTION [Migration].[fn_GetNewPersonIDByUserName]
(
	@UserName nvarchar(50)
)
RETURNS int
AS
BEGIN
	declare @NewPersonID int
	set @NewPersonID=0
	select @NewPersonID = BusinessEntityID From Person.Credential where Username = @UserName
	return @NewPersonID
END
