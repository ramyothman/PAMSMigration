-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [Migration].[mg_GetNewAddressID]
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
		SELECT @Result = AddressId From Person.[Address] where EgyptID = @OldID
	Else if (@TypeId = 2)
		SELECT @Result = AddressId From Person.[Address] where RPEID = @OldID
	Else if (@TypeId = 3)
		SELECT @Result = AddressId From Person.[Address] where QatarID = @OldID
	-- Return the result of the function
	RETURN @Result
END
