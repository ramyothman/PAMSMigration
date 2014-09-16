CREATE PROCEDURE [dbo].[InsertNewMailJobs]
     @ID int output 
    ,@InquiryNumber nvarchar(50)
    ,@MailID int
    ,@UserName nvarchar(50)
    ,@ModifiedDate datetime
AS
INSERT INTO [dbo].[JobsMails]
           ([InquiryNumber]
           ,[MailID]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@InquiryNumber
           ,@MailID
           ,@UserName
           ,@ModifiedDate)
Set @ID = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from [dbo].[JobsMails]
Where [ID] = @ID
