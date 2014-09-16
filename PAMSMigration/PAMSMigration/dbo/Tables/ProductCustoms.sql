CREATE TABLE [dbo].[ProductCustoms] (
    [ProductCustomID] INT             NOT NULL,
    [Name]            NVARCHAR (50)   NULL,
    [CustomValue]     DECIMAL (18, 2) NULL,
    [IsPercent]       BIT             NULL,
    CONSTRAINT [PK_ProductCustoms] PRIMARY KEY CLUSTERED ([ProductCustomID] ASC)
);

