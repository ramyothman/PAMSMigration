CREATE PROCEDURE [dbo].[GetByIDProjectsComments]
    @ProjectCommentID int
AS
BEGIN
Select * From [dbo].[ProjectsComments]
WHERE ProjectCommentID = @ProjectCommentID
END
