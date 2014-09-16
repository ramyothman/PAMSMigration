CREATE PROCEDURE [dbo].[UpdateTimeSheet]
            @OldID int           
           ,@PersonID int
           ,@SheetDate datetime
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@BranchID int
AS
  UPDATE [dbo].[TimeSheet]
   SET [PersonID] = @PersonID
      ,[SheetDate] = @SheetDate
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[BranchID] = @BranchID
 WHERE [ID] = @OldID
IF @@ROWCOUNT > 0
Select * From [dbo].[TimeSheet] 
Where [ID] = @OldID
