CREATE TABLE [dbo].[UserRoles] (
    [ID]     INT IDENTITY (1, 1) NOT NULL,
    [RoleID] INT NULL,
    [UserID] INT NULL,
    CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_UserRoles_Credential] FOREIGN KEY ([UserID]) REFERENCES [Person].[Credential] ([BusinessEntityId]),
    CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
);

