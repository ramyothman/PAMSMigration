CREATE PROCEDURE [dbo].[DeleteProjectsComments]
    @ProjectCommentID int
AS
Begin
 Delete [dbo].[ProjectsComments] where     ProjectCommentID = @ProjectCommentID
End
