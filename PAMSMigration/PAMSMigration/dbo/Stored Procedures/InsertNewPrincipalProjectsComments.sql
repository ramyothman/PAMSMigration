CREATE PROCEDURE [dbo].[InsertNewPrincipalProjectsComments]
    @CommentedByID int, 
    @InquiryNumber nvarchar(50),
    @Comment nvarchar(max),
    @UserName nvarchar(50),
    @ModifiedDate datetime
AS
INSERT INTO [dbo].[PrincipalProjectsComments]
           ([CommentedByID]
           ,[InquiryNumber]
           ,[Comment]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@CommentedByID
           ,@InquiryNumber
           ,@Comment
           ,@UserName
           ,@ModifiedDate)
IF @@ROWCOUNT > 0
Select * from PrincipalProjectsComments
Where [ID] = @@identity
