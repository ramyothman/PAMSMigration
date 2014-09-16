CREATE TABLE [dbo].[SystemSecurityFunctions] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [SecurityFunctionCode] NVARCHAR (50)  NULL,
    [SecurityFunction]     NVARCHAR (255) NULL,
    [PageID]               INT            NULL,
    [IsActive]             BIT            NULL,
    CONSTRAINT [PK_SystemSecurityFunctions] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_SystemSecurityFunctions_SystemPages] FOREIGN KEY ([PageID]) REFERENCES [dbo].[SystemPages] ([ID])
);

