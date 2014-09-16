CREATE  PROCEDURE [dbo].[UpdatePersonPersonTypes]
    @OldPersonPersonTypesId int,
    @Name nvarchar(50),
    @RowGuid uniqueidentifier,
    @ModifiedDate datetime
AS
UPDATE [Person].[PersonPersonTypes]
SET
    Name = @Name,
    RowGuid = @RowGuid,
    ModifiedDate = @ModifiedDate
WHERE [PersonPersonTypesId] = @OLDPersonPersonTypesId
IF @@ROWCOUNT > 0
Select * From Person.PersonPersonTypes 
Where [PersonPersonTypesId] = @OLDPersonPersonTypesId
