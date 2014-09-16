CREATE PROCEDURE [dbo].[UpdateProjectsComments]
            @ProjectID int
           ,@Comment nvarchar(max)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@oldProjectCommentID int
  
AS
UPDATE [dbo].[ProjectsComments]
   SET [ProjectID] = @ProjectID
      ,[Comment] = @Comment
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE [ProjectCommentID] = @oldProjectCommentID
