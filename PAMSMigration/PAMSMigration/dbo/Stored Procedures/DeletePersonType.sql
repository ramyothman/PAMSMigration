CREATE  PROCEDURE [dbo].[DeletePersonType]
    @PersonTypeId int
AS
Begin
 Delete [Person].[PersonType] where     [PersonTypeId] = @PersonTypeId
End
