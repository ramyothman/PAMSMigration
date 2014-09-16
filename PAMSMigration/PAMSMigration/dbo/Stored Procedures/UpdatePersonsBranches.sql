CREATE PROCEDURE [dbo].[UpdatePersonsBranches]
    @OldID int ,
    @PersonID int,
    @BranchID int,
    @UserName nvarchar(50),
    @ModifiedDate datetime,
    @DefaultBranch bit
 AS
    
UPDATE [dbo].[PersonsBranches]
   SET [PersonID] = @PersonID
      ,[BranchID] = @BranchID
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[DefaultBranch] = @DefaultBranch
 WHERE ID = @OldID
