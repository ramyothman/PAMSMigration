CREATE TABLE [dbo].[TwitterFollowers] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [UserID]               INT            NULL,
    [FollwerID]            INT            NULL,
    [IsAccepted]           BIT            NULL,
    [RequestDate]          DATETIME       NULL,
    [AcceptanceDate]       DATETIME       NULL,
    [FollowerTypeID]       INT            NULL,
    [RequestComment]       NVARCHAR (MAX) NULL,
    [ProjectInquiryNumber] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_TwitterFollowers] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_TwitterFollowers_TweetByTypes] FOREIGN KEY ([FollowerTypeID]) REFERENCES [dbo].[TweetByTypes] ([ID])
);

