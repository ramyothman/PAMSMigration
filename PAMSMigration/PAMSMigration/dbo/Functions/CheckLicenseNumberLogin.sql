/****** Object:  UserDefinedFunction [dbo].[CheckLicenseNumberLogin]    Script Date: 03/20/2013 12:55:44 ******/
CREATE FUNCTION [dbo].[CheckLicenseNumberLogin]
(
	-- Add the parameters for the function here
	@UserID int,
	@IPAddress nvarchar(50),
	@NumOfMins int
)
RETURNS bit
AS
BEGIN
	declare @result bit
	
	
	return @result
END
