CREATE PROCEDURE [dbo].[DeleteCompanyBranches]
    @ID int
AS
Begin
 Delete [dbo].[CompanyBranches] where ID = @ID
End
