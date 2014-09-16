CREATE PROCEDURE [dbo].[UpdateCategories]
    @OldCategoryID int,
    @CategoryName nvarchar(50),
    @CategoryDescription ntext,
    @UserName nvarchar(50),
    @ModifiedDate datetime,
    @BranchID int
AS
UPDATE [dbo].[Categories]
SET
    CategoryName = @CategoryName,
    CategoryDescription = @CategoryDescription,
    UserName = @UserName,
    ModifiedDate = @ModifiedDate--,
    --BranchID = @BranchID
WHERE [CategoryID] = @OLDCategoryID
IF @@ROWCOUNT > 0
update CategoryBranches set BranchID=@BranchID
where CategoryID = @OldCategoryID
Select * From Categories 
Where [CategoryID] = @OLDCategoryID
