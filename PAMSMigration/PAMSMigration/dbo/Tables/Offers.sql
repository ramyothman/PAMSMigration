CREATE TABLE [dbo].[Offers] (
    [OfferID]              INT             IDENTITY (1, 1) NOT NULL,
    [ClientID]             INT             NULL,
    [OfferNo]              NVARCHAR (50)   NULL,
    [TotalPrice]           DECIMAL (18, 2) NULL,
    [RateToEuro]           DECIMAL (18, 2) NULL,
    [TotalPriceInEuro]     DECIMAL (18, 2) NULL,
    [Discount]             DECIMAL (18, 2) NULL,
    [DiscountInEuro]       DECIMAL (18, 2) NULL,
    [CurrencyID]           INT             NULL,
    [CreationDate]         DATETIME        NULL,
    [OfferDate]            DATETIME        NULL,
    [CalculationSheetID]   INT             NULL,
    [TotalWithTaxesInEuro] DECIMAL (18, 2) NULL,
    [TotalPriceWithTaxes]  DECIMAL (18, 2) NULL,
    [IsCompletelyOrdered]  BIT             NULL,
    CONSTRAINT [PK_Offers] PRIMARY KEY CLUSTERED ([OfferID] ASC),
    CONSTRAINT [FK_Offers_CalculationSheet] FOREIGN KEY ([CalculationSheetID]) REFERENCES [dbo].[CalculationSheet] ([CalculationSheetID])
);

