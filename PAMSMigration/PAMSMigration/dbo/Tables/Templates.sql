CREATE TABLE [dbo].[Templates] (
    [ID]           INT           NOT NULL,
    [Name]         NVARCHAR (50) NULL,
    [TemplateFL]   NTEXT         NULL,
    [TemplateSL]   NTEXT         NULL,
    [UserName]     NVARCHAR (50) NULL,
    [ModifiedDate] DATETIME      NULL,
    CONSTRAINT [PK_Templates] PRIMARY KEY CLUSTERED ([ID] ASC)
);

