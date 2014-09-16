-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateBussinessTwitter]
            @TweetText nvarchar(max)
            ,@TweetByID int
           ,@TweetBy nvarchar(50)
           ,@TweetByRealName nvarchar(500)           
           ,@ModifiedDate datetime
           ,@TweetByTypeID int
	       ,@oldID int
 AS
BEGIN
UPDATE [dbo].[BussinessTwitter]
   SET [TweetText] = @TweetText
      ,[TweetByID] = @TweetByID
      ,[TweetBy] = @TweetBy
      ,[TweetByRealName] = @TweetByRealName
      ,[TweetTypeID] = @TweetByTypeID     
      ,[ModifiedDate] = @ModifiedDate
  WHERE ID = @oldID
END
