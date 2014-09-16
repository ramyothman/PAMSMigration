CREATE PROCEDURE [dbo].[UpdateConcurrentUser]
			@OldID int
		   ,@UserID int
           ,@IPAddress nvarchar(50)
           ,@LoginDate datetime
           ,@IsIn bit
           ,@LogoutDate datetime
           ,@IsSuspended bit
           ,@SuspensionDate datetime
           ,@PulseDate datetime
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@BranchID int
AS
UPDATE [dbo].[ConcurrentUsers]
   SET [UserID] =@UserID
      ,[IPAddress] =@IPAddress
      ,[LoginDate] =@LoginDate
      ,[IsIn] =@IsIn
      ,[LogoutDate] =@LogoutDate
      ,[IsSuspended] =@IsSuspended
      ,[SuspensionDate] =@SuspensionDate
      ,[PulseDate] =@PulseDate
      ,[UserName] =@UserName
      ,[ModifiedDate] =@ModifiedDate
 WHERE ID = @OldID
IF @@ROWCOUNT > 0
Select * From [dbo].[ConcurrentUsers]
Where [ID] = @OldID
