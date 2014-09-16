CREATE PROCEDURE [dbo].[InsertNewProducts]
    @CategoryID int,
    @ProductName nvarchar(50),
    @ProductDescription ntext,
    @UserName nvarchar(50),
    @ModifiedDate datetime,
    @IsActive bit,
    @BranchID int
AS
INSERT INTO [dbo].[Products] (
    [CategoryID],
    [ProductName],
    [ProductDescription],
    [UserName],
    [ModifiedDate],
    [IsActive],
    [BranchID])
Values (
    @CategoryID,
    @ProductName,
    @ProductDescription,
    @UserName,
    @ModifiedDate,
    @IsActive,
    @BranchID)
IF @@ROWCOUNT > 0
Select * from Products
Where [ProductID] = @@identity
