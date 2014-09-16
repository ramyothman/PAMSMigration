CREATE TABLE [dbo].[CalculationSheetCommission] (
    [CalculationSheetCommissionID] INT             NOT NULL,
    [CalculationSheetID]           INT             NULL,
    [AgentName]                    NVARCHAR (50)   NULL,
    [CommissionAmount]             DECIMAL (18, 2) NULL,
    [CommissionRateToEuro]         DECIMAL (18, 2) NULL,
    [CommissionAmountinEuro]       DECIMAL (18, 2) NULL,
    [CurrencyID]                   INT             NULL,
    CONSTRAINT [PK_CalculationSheetCommission] PRIMARY KEY CLUSTERED ([CalculationSheetCommissionID] ASC),
    CONSTRAINT [FK_CalculationSheetCommission_CalculationSheet] FOREIGN KEY ([CalculationSheetID]) REFERENCES [dbo].[CalculationSheet] ([CalculationSheetID]) ON DELETE CASCADE ON UPDATE CASCADE
);

