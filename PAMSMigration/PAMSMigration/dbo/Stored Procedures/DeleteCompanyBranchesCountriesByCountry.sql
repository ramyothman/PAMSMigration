CREATE PROCEDURE [dbo].[DeleteCompanyBranchesCountriesByCountry]
    @CountryID int
AS
Begin
 Delete [dbo].[CompanyBranchesCountries] where CountryID = @CountryID
End
