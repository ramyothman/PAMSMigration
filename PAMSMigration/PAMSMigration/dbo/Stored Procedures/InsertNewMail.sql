CREATE PROCEDURE [dbo].[InsertNewMail]
     @ID int output 
    ,@MailHeader nvarchar(max)
    ,@MailBody nvarchar(max)
    ,@ToContacts nvarchar(max)
    ,@FromContact nvarchar(200)
    ,@CCContacts nvarchar(max)
    ,@HasAttachments bit
    ,@SentDate datetime
AS
INSERT INTO [dbo].[Mails]
           ([MailHeader]
           ,[MailBody]
           ,[ToContacts]
           ,[FromContact]
           ,[CCContacts]
           ,[HasAttachments]
           ,[SentDate])
     VALUES
           (@MailHeader
           ,@MailBody
           ,@ToContacts
           ,@FromContact
           ,@CCContacts
           ,@HasAttachments
           ,@SentDate)
Set @ID = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from [dbo].[Mails]
Where [ID] = @ID
