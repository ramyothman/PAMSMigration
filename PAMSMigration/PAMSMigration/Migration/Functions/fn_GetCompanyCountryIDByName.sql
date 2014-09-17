--End Company Countries
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetCompanyCountryIDByName]
(
	@CountryName nvarchar(50)
)
RETURNS INT
AS
BEGIN
	Declare @ID int
	Select @ID = [ID] from [dbo].[CompanyCountries] where [CountryName] = @CountryName
	RETURN @ID
END
