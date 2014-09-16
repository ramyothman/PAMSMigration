CREATE PROCEDURE [dbo].[InsertNewCategories]
    @CategoryName nvarchar(50),
    @CategoryDescription ntext,
    @UserName nvarchar(50),
    @ModifiedDate datetime,
    @BranchID int
AS
INSERT INTO [dbo].[Categories] (
    [CategoryName],
    [CategoryDescription],
    [UserName],
    [ModifiedDate])
Values (
    @CategoryName,
    @CategoryDescription,
    @UserName,
    @ModifiedDate)
IF @@ROWCOUNT > 0
insert into CategoryBranches(CategoryID,BranchID)
values(@@Identity,@BranchID)
Select * from Categories
Where [CategoryID] = @@identity
