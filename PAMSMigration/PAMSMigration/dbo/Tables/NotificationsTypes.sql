CREATE TABLE [dbo].[NotificationsTypes] (
    [NotificationTypeID] INT           IDENTITY (1, 1) NOT NULL,
    [NotificationType]   NVARCHAR (50) NULL,
    [UserName]           NVARCHAR (50) NULL,
    [ModifiedDate]       DATETIME      NULL,
    CONSTRAINT [PK_NotificationsTypes] PRIMARY KEY CLUSTERED ([NotificationTypeID] ASC)
);

