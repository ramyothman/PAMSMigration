CREATE PROCEDURE [dbo].[InsertNewEducationType]
    @EducationTypeId int output ,
    @EducationTypeName nvarchar(50)
AS
INSERT INTO [Person].[EducationType]
           ([EducationTypeName])
     VALUES
           (@EducationTypeName)
Set @EducationTypeId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.[EducationType]
Where [EducationTypeId] = @EducationTypeId
