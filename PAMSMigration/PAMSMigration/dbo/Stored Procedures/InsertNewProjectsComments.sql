-------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[InsertNewProjectsComments]
            @ProjectID int
           ,@Comment nvarchar(max)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
declare @StatusID int 
select @StatusID = ProjectStatusID from Projects where ID = @ProjectID
INSERT INTO [dbo].[ProjectsComments]
           ([ProjectID]
           ,[Comment]
           ,[UserName]
           ,[ModifiedDate]
           ,ProjectStatusID)
     VALUES
           (@ProjectID
           ,@Comment
           ,@UserName
           ,@ModifiedDate
           ,@StatusID)
IF @@ROWCOUNT > 0
Select * from ProjectsComments
Where [ProjectCommentID] = @@IDENTITY
