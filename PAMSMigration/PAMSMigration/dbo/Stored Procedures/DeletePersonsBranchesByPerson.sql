CREATE PROCEDURE [dbo].[DeletePersonsBranchesByPerson]
    @PersonID int
AS
Begin
 Delete [dbo].[PersonsBranches] where PersonID = @PersonID
End
