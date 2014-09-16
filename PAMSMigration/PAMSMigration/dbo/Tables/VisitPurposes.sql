CREATE TABLE [dbo].[VisitPurposes] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [VisitID]      INT            NULL,
    [Reason]       NVARCHAR (255) NULL,
    [AchivmentID]  INT            NULL,
    [UserName]     NVARCHAR (50)  NULL,
    [ModifiedDate] DATETIME       NULL,
    CONSTRAINT [PK_VisitPurposes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_VisitPurposes_Visits] FOREIGN KEY ([VisitID]) REFERENCES [dbo].[Visits] ([VisitId]),
    CONSTRAINT [FK_VisitPurposes_VisitsAchievments] FOREIGN KEY ([AchivmentID]) REFERENCES [dbo].[VisitsAchievments] ([ID])
);

