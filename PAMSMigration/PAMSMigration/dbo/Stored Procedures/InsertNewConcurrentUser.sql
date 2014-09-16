CREATE PROCEDURE [dbo].[InsertNewConcurrentUser]
            @ID int output 
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
           ,@MaxNumOfMins int
           ,@BranchID int
AS
declare @Result bit
set @Result = [dbo].[CheckIsUserLogin](@UserID,@IPAddress,@MaxNumOfMins)
if(@Result = 'False')
 Begin
    INSERT INTO [dbo].[ConcurrentUsers]
           ([UserID]
           ,[IPAddress]
           ,[LoginDate]
           ,[IsIn]
           ,[LogoutDate]
           ,[IsSuspended]
           ,[SuspensionDate]
           ,[PulseDate]
           ,[UserName]
           ,[ModifiedDate]
           ,BranchID)
     VALUES
           (@UserID
           ,@IPAddress
           ,@LoginDate
           ,@IsIn
           ,@LogoutDate
           ,@IsSuspended
           ,@SuspensionDate
           ,@PulseDate
           ,@UserName
           ,@ModifiedDate
           ,@BranchID)
    Set @ID = SCOPE_IDENTITY()
	IF @@ROWCOUNT > 0
	Select * from [dbo].[ConcurrentUsers]
	Where [ID] = @@identity
 END
 
 else
 Begin 
    select @ID = ID from [dbo].[ConcurrentUsers] 
    where UserID = @UserID and IPAddress = @IPAddress and
    [dbo].[GetConcurrentUsersDateDifferenceByMin] (PulseDate)< @MaxNumOfMins
 
	 UPDATE [dbo].[ConcurrentUsers]
	   SET [PulseDate] = GETDATE()   
	 WHERE ID = @ID
 end
