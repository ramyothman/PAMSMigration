CREATE PROCEDURE [dbo].[DeleteEducationType]
    @EducationTypeId int
AS
Begin
    DELETE FROM [Person].[EducationType]
     where     [EducationTypeId] = @EducationTypeId
End
