CREATE PROCEDURE [dbo].[InsertNewProductType]
    @Name nvarchar(50)
AS
INSERT INTO [dbo].[ProductType] (
    [Name])
Values (
    @Name)
IF @@ROWCOUNT > 0
Select * from ProductType
Where [ProductTypeID] = @@identity
