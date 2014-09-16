CREATE TABLE [dbo].[ReportType] (
    [ReportTypeID] INT           NOT NULL,
    [ReportName]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_ReportType] PRIMARY KEY CLUSTERED ([ReportTypeID] ASC)
);

