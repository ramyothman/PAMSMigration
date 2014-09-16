CREATE  PROCEDURE [dbo].[DeletePersonExtra]
    @PersonId int
AS
Begin
 Delete [Person].[PersonExtra] where     [PersonID] = @PersonId
End
