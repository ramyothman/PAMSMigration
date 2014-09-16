-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [Migration].[mg_GetNewCityIDByCityName]
(
	-- Add the parameters for the function here
	@CityName nvarchar(50),
	@CountryRegionCode nvarchar(50)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int
	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = ID From dbo.Cities where City = @CityName and CountryRegionCode = @CountryRegionCode
	-- Return the result of the function
	RETURN @Result
END
