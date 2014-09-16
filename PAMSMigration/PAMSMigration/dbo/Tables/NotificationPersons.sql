CREATE TABLE [dbo].[NotificationPersons] (
    [NotificationPersonID] INT           IDENTITY (1, 1) NOT NULL,
    [NotificationID]       INT           NULL,
    [PersonID]             INT           NULL,
    [IsRead]               BIT           NULL,
    [UserName]             NVARCHAR (50) NULL,
    [ModifiedDate]         DATETIME      NULL,
    CONSTRAINT [PK_NotificationPersons] PRIMARY KEY CLUSTERED ([NotificationPersonID] ASC)
);

