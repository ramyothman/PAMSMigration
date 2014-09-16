CREATE TABLE [dbo].[Notifications] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [NotificationTypeID] INT            NULL,
    [Notification]       NVARCHAR (MAX) NULL,
    [PersonID]           INT            NULL,
    [RelatedFormName]    NVARCHAR (500) NULL,
    [RelatedID]          INT            NULL,
    [UserName]           NVARCHAR (50)  NULL,
    [ModifiedDate]       DATETIME       NULL,
    [BranchID]           INT            NULL,
    [EgyptID]            INT            NULL,
    [RPEID]              INT            NULL,
    [QatarID]            INT            NULL,
    CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED ([ID] ASC)
);

