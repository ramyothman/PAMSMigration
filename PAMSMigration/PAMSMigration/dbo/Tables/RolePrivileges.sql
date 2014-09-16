CREATE TABLE [dbo].[RolePrivileges] (
    [ID]               INT IDENTITY (1, 1) NOT NULL,
    [RoleID]           INT NULL,
    [PageID]           INT NULL,
    [SystemFunctionID] INT NULL,
    CONSTRAINT [PK_RolePrivileges] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_RolePrivileges_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_RolePrivileges_SystemFunctions] FOREIGN KEY ([SystemFunctionID]) REFERENCES [dbo].[SystemFunctions] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_RolePrivileges_SystemPages] FOREIGN KEY ([PageID]) REFERENCES [dbo].[SystemPages] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
);

