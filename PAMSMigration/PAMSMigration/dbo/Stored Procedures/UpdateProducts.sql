CREATE PROCEDURE [dbo].[UpdateProducts]
    @OldProductID int,
    @CategoryID int,
    @ProductName nvarchar(50),
    @ProductDescription ntext,
    @UserName nvarchar(50),
    @ModifiedDate datetime,
    @IsActive bit,
    @BranchID int
AS
UPDATE [dbo].[Products]
SET
    CategoryID = @CategoryID,
    ProductName = @ProductName,
    ProductDescription = @ProductDescription,
    UserName = @UserName,
    ModifiedDate = @ModifiedDate,
    IsActive = @IsActive,
    BranchID = @BranchID
WHERE [ProductID] = @OLDProductID
IF @@ROWCOUNT > 0
Select * From Products 
Where [ProductID] = @OLDProductID
