CREATE PROCEDURE [dbo].[UpdatePrincipalProjectsComments]
    @oldID int,
    @CommentedByID int, 
    @InquiryNumber nvarchar(50),
    @Comment nvarchar(max),
    @UserName nvarchar(50),
    @ModifiedDate datetime
AS
UPDATE [dbo].[PrincipalProjectsComments]
   SET [CommentedByID] = @CommentedByID
      ,[InquiryNumber] = @InquiryNumber
      ,[Comment] = @Comment
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @oldID
