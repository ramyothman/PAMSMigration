CREATE PROCEDURE [dbo].[UpdateEducationType]
    @OldEducationTypeId int,
    @EducationTypeName nvarchar(50)
AS
UPDATE [Person].[EducationType]
   SET [EducationTypeName] = @EducationTypeName
WHERE [EducationTypeId] = @OLDEducationTypeId
IF @@ROWCOUNT > 0
Select * From Person.[EducationType] 
Where [EducationTypeId] = @OLDEducationTypeId
