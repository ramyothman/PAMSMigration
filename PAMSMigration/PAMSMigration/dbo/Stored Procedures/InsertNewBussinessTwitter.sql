CREATE PROCEDURE [dbo].[InsertNewBussinessTwitter]
           
           @TweetText nvarchar(max)
           ,@TweetByID int
           ,@TweetBy nvarchar(50)
           ,@TweetByRealName nvarchar(500)    
           ,@TweetByTypeID int       
           ,@ModifiedDate datetime
AS
INSERT INTO [dbo].[BussinessTwitter]
           ([TweetText]
           ,[TweetByID]
           ,[TweetBy]
           ,[TweetByRealName]
           ,[TweetTypeID]
           ,[ModifiedDate])
     VALUES
           (@TweetText
           ,@TweetByID
           ,@TweetBy
           ,@TweetByRealName
           ,@TweetByTypeID
           ,@ModifiedDate)
IF @@ROWCOUNT > 0
Select * from BussinessTwitter
Where [ID] = @@identity
