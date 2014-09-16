CREATE TABLE [dbo].[ReportTemplate] (
    [ReportTemplateID] INT            IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (50)  NULL,
    [ReportTypeID]     INT            NULL,
    [Description]      NVARCHAR (500) NULL,
    [ReportContent]    IMAGE          NULL,
    [IsMain]           BIT            NULL,
    CONSTRAINT [PK_ReportTemplate] PRIMARY KEY CLUSTERED ([ReportTemplateID] ASC)
);

