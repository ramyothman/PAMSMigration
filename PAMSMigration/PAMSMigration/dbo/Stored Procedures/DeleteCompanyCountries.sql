CREATE PROCEDURE [dbo].[DeleteCompanyCountries]
    @ID int
AS
Begin
 Delete [dbo].[CompanyCountries] where ID = @ID
End
