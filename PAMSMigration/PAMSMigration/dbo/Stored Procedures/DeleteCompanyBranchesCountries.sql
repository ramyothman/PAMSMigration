CREATE PROCEDURE [dbo].[DeleteCompanyBranchesCountries]
    @ID int
AS
Begin
 Delete [dbo].[CompanyBranchesCountries] where ID = @ID
End
