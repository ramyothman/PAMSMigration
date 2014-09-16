CREATE TABLE [dbo].[ProjectsGuaranteeRenews] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [GuaranteeID]  INT           NULL,
    [RenewDate]    DATETIME      NULL,
    [UserName]     NVARCHAR (50) NULL,
    [ModifiedDate] DATETIME      NULL,
    CONSTRAINT [PK_GuaranteeRenews] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProjectsGuaranteeRenews_ProjectsGuarantee] FOREIGN KEY ([GuaranteeID]) REFERENCES [dbo].[ProjectsGuarantee] ([ID])
);

