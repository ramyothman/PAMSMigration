CREATE PROCEDURE [dbo].[UpdateProductColumns]
    @OldID int,
    @Name nvarchar(50),
    @Caption nvarchar(50),
    @TypeName nvarchar(50)
AS
UPDATE [dbo].[ProductColumns]
SET
    Name = @Name,
    Caption = @Caption,
    TypeName = @TypeName
WHERE [ID] = @OLDID
IF @@ROWCOUNT > 0
Select * From ProductColumns 
Where [ID] = @OLDID
