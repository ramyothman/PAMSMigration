CREATE TABLE [dbo].[ProjectsHistoryDetailsYearlyHistory] (
    [ID]                         INT           NOT NULL,
    [ProjectHistoryID]           INT           NULL,
    [OrdersYearlyHistorytatusID] INT           NULL,
    [InquiryStatusID]            INT           NULL,
    [UserName]                   NVARCHAR (50) NULL,
    [ModifiedDate]               DATETIME      NULL,
    CONSTRAINT [PK_ProjectsHistoryDetailsYearlyHistory] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProjectsHistoryDetailsYearlyHistory_ProjectsHistoryYearlyHistory] FOREIGN KEY ([ProjectHistoryID]) REFERENCES [dbo].[ProjectsHistoryYearlyHistory] ([ID]) ON DELETE CASCADE
);

