CREATE  PROCEDURE [dbo].[DeletePersonPersonTypes]
    @PersonPersonTypesId int
AS
Begin
 Delete [Person].[PersonPersonTypes] where     [PersonPersonTypesId] = @PersonPersonTypesId
End
