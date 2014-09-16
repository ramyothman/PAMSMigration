CREATE TABLE [dbo].[CalculationSheetDetailFreight] (
    [CalculationSheetDetailFreightID] INT             IDENTITY (1, 1) NOT NULL,
    [CalculationSheetDetailID]        INT             NULL,
    [FreightBaseID]                   INT             NULL,
    [FreightPrice]                    DECIMAL (18, 2) NULL,
    [FreightCurrencyID]               INT             NULL,
    [FreightRateToCurrencyBase]       DECIMAL (18, 2) NULL,
    [FreightPriceInCurrencyBase]      DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_CalculationSheetDetailFreight] PRIMARY KEY CLUSTERED ([CalculationSheetDetailFreightID] ASC),
    CONSTRAINT [FK_CalculationSheetDetailFreight_CalculationSheetDetail] FOREIGN KEY ([CalculationSheetDetailID]) REFERENCES [dbo].[CalculationSheetDetail] ([CalculationSheetDetailID]) ON DELETE CASCADE ON UPDATE CASCADE
);

