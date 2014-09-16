CREATE TABLE [dbo].[CalculationSheetDetailCustoms] (
    [CalculationSheetDetailCustomID] INT             IDENTITY (1, 1) NOT NULL,
    [CalculationSheetDetailID]       INT             NULL,
    [ProductCustomID]                INT             NULL,
    [Amount]                         DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_CalculationSheetDetailCustoms] PRIMARY KEY CLUSTERED ([CalculationSheetDetailCustomID] ASC),
    CONSTRAINT [FK_CalculationSheetDetailCustoms_CalculationSheetDetail] FOREIGN KEY ([CalculationSheetDetailID]) REFERENCES [dbo].[CalculationSheetDetail] ([CalculationSheetDetailID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_CalculationSheetDetailCustoms_ProductCustoms] FOREIGN KEY ([ProductCustomID]) REFERENCES [dbo].[ProductCustoms] ([ProductCustomID]) ON DELETE CASCADE ON UPDATE CASCADE
);

