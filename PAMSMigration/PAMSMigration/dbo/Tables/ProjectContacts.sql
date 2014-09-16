CREATE TABLE [dbo].[ProjectContacts] (
    [ProjectContactID] INT           IDENTITY (1, 1) NOT NULL,
    [ProjectID]        INT           NULL,
    [ContactTitle]     NVARCHAR (50) NULL,
    [ContactName]      NVARCHAR (50) NULL,
    [ContactPosition]  NVARCHAR (50) NULL,
    [Mobile]           NVARCHAR (50) NULL,
    [Email]            NVARCHAR (50) NULL,
    CONSTRAINT [PK_ProjectContacts] PRIMARY KEY CLUSTERED ([ProjectContactID] ASC),
    CONSTRAINT [FK_ProjectContacts_Projects] FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[Projects] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
);

