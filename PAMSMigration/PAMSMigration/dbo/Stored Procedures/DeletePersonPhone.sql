CREATE  PROCEDURE [dbo].[DeletePersonPhone]
    @PersonPhoneId int
AS
Begin
 Delete [Person].[PersonPhone] where     [PersonPhoneId] = @PersonPhoneId
End
