CREATE PROCEDURE [dbo].[DeleteCompanyBranchesCountriesByBranch]
    @BranchID int
AS
Begin
 Delete [dbo].[CompanyBranchesCountries] where BranchID = @BranchID
End
