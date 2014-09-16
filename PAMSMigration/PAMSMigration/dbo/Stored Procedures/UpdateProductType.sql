CREATE PROCEDURE [dbo].[UpdateProductType]
    @Name nvarchar(50),
    @OldProductTypeID int
AS
UPDATE [dbo].[ProductType]
SET
    Name = @Name
WHERE [ProductTypeID] = @OLDProductTypeID
IF @@ROWCOUNT > 0
Select * From ProductType 
Where [ProductTypeID] = @OLDProductTypeID
