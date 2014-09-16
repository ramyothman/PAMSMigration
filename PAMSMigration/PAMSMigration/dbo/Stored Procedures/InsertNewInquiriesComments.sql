CREATE PROCEDURE [dbo].[InsertNewInquiriesComments]
            @InquiryNumber nvarchar(50)
           ,@Comment nvarchar(max)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime,
           @ProjectTypeID int
AS
INSERT INTO [dbo].[InquiriesComments]
           ([InquiryNumber]
           ,[Comment]
           ,[UserName]
           ,[ModifiedDate],
           [ProjectTypeID])
     VALUES
           (@InquiryNumber
           ,@Comment
           ,@UserName
           ,@ModifiedDate
           ,@ProjectTypeID)
    
IF @@ROWCOUNT > 0
Select *
from [dbo].[InquiriesComments]
Where ID = @@IDENTITY
