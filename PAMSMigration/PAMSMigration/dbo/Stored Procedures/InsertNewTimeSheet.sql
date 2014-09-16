CREATE PROCEDURE [dbo].[InsertNewTimeSheet]
            @ID int output           
           ,@PersonID int
           ,@SheetDate datetime
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@BranchID int
AS
INSERT INTO [dbo].[TimeSheet]
           ([PersonID]
           ,[SheetDate]
           ,[UserName]
           ,[ModifiedDate]
           ,[BranchID])
     VALUES
           (@PersonID
           ,@SheetDate
           ,@UserName
           ,@ModifiedDate
           ,@BranchID)
           
set @ID =  @@identity
IF @@ROWCOUNT > 0
Select * from [TimeSheet]
Where [ID] = @ID
