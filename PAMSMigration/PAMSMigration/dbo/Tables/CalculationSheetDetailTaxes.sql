CREATE TABLE [dbo].[CalculationSheetDetailTaxes] (
    [CalculationSheetDetailTaxID] INT IDENTITY (1, 1) NOT NULL,
    [CalculationSheetDetailID]    INT NULL,
    [TaxID]                       INT NULL,
    CONSTRAINT [PK_CalculationSheetDetailTaxes] PRIMARY KEY CLUSTERED ([CalculationSheetDetailTaxID] ASC),
    CONSTRAINT [FK_CalculationSheetDetailTaxes_CalculationSheetDetail] FOREIGN KEY ([CalculationSheetDetailID]) REFERENCES [dbo].[CalculationSheetDetail] ([CalculationSheetDetailID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_CalculationSheetDetailTaxes_Taxes] FOREIGN KEY ([TaxID]) REFERENCES [dbo].[Taxes] ([TaxID]) ON DELETE CASCADE ON UPDATE CASCADE
);

