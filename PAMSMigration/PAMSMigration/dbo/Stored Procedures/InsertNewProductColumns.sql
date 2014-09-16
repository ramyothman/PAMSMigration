CREATE PROCEDURE [dbo].[InsertNewProductColumns]
    @Name nvarchar(50),
    @Caption nvarchar(50),
    @TypeName nvarchar(50)
AS
INSERT INTO [dbo].[ProductColumns] (
    [Name],
    [Caption],
    [TypeName])
Values (
    @Name,
    @Caption,
    @TypeName)
IF @@ROWCOUNT > 0
Select * from ProductColumns
Where [ID] = @@identity
