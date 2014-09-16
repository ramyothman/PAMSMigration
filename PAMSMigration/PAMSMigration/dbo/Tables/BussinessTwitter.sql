CREATE TABLE [dbo].[BussinessTwitter] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [TweetText]       NVARCHAR (MAX) NULL,
    [TweetByID]       INT            NULL,
    [TweetBy]         NVARCHAR (50)  NULL,
    [TweetByRealName] NVARCHAR (500) NULL,
    [TweetTypeID]     INT            NULL,
    [ModifiedDate]    DATETIME       NULL,
    [EgyptID]         INT            NULL,
    [RPEID]           INT            NULL,
    [QatarID]         INT            NULL,
    CONSTRAINT [PK_BussinessTwitter] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_BussinessTwitter_TweetByTypes] FOREIGN KEY ([TweetTypeID]) REFERENCES [dbo].[TweetByTypes] ([ID])
);

