CREATE TABLE [dbo].[UsersProjectsLog] (
    [UserID]       INT      NOT NULL,
    [ProjectLogID] INT      NOT NULL,
    [IsViewed]     BIT      NULL,
    [ViewedDate]   DATETIME NULL,
    CONSTRAINT [PK_UsersProjectsLog] PRIMARY KEY CLUSTERED ([UserID] ASC, [ProjectLogID] ASC)
);

