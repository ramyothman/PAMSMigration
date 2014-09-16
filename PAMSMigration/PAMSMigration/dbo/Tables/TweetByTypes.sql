CREATE TABLE [dbo].[TweetByTypes] (
    [ID]          INT           NOT NULL,
    [TweetByType] NVARCHAR (50) NULL,
    CONSTRAINT [PK_TweetByTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

