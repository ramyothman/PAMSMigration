CREATE PROCEDURE [dbo].[UpdateInquiriesComments]
     @InquiryNumber nvarchar(50)
           ,@Comment nvarchar(max)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@ProjectTypeID int
           ,@OldID int
AS
UPDATE [dbo].[InquiriesComments]
   SET [InquiryNumber] = @InquiryNumber
      ,[Comment] = @Comment
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[ProjectTypeID] = @ProjectTypeID
 WHERE ID = @OldID
