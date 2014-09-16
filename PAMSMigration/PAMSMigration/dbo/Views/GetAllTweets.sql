CREATE VIEW [dbo].[GetAllTweets]
AS
SELECT     dbo.BussinessTwitter.ID, dbo.BussinessTwitter.TweetText, dbo.BussinessTwitter.TweetBy, dbo.BussinessTwitter.TweetByRealName, 
                      dbo.BussinessTwitter.ModifiedDate, dbo.BussinessTwitter.TweetTypeID, dbo.TweetByTypes.TweetByType, dbo.BussinessTwitter.TweetByID
FROM         dbo.BussinessTwitter INNER JOIN
                      dbo.TweetByTypes ON dbo.BussinessTwitter.TweetTypeID = dbo.TweetByTypes.ID
