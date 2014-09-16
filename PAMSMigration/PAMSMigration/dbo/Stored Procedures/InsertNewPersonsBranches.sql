CREATE PROCEDURE [dbo].[InsertNewPersonsBranches]
    @ID int output ,
    @PersonID int,
    @BranchID int,
    @UserName nvarchar(50),
    @ModifiedDate datetime,
    @DefaultBranch bit
 AS
    
INSERT INTO [dbo].[PersonsBranches]
           ([PersonID]
           ,[BranchID]
           ,[UserName]
           ,[ModifiedDate]
           ,[DefaultBranch])
     VALUES
           (@PersonID
           ,@BranchID
           ,@UserName
           ,@ModifiedDate
           ,@DefaultBranch)
IF @@ROWCOUNT > 0
    set @ID = SCOPE_IDENTITY()
Select * from [dbo].[PersonsBranches]
Where [ID] = @ID
