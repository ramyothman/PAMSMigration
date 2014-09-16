CREATE TABLE [dbo].[ProjectsHistoryDetails] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [ProjectHistoryID] INT           NULL,
    [OrderStatusID]    INT           NULL,
    [InquiryStatusID]  INT           NULL,
    [UserName]         NVARCHAR (50) NULL,
    [ModifiedDate]     DATETIME      NULL,
    CONSTRAINT [PK_ProjectStatusDetails] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProjectsHistoryDetails_ProjectsHistory] FOREIGN KEY ([ProjectHistoryID]) REFERENCES [dbo].[ProjectsHistory] ([ID]) ON DELETE CASCADE
);

