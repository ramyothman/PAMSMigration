﻿CREATE TABLE [dbo].[CalculationSheetDetail] (
    [CalculationSheetDetailID] INT             IDENTITY (1, 1) NOT NULL,
    [CalculationSheetID]       INT             NULL,
    [ItemNumber]               INT             NULL,
    [ItemID]                   INT             NULL,
    [ProductID]                INT             NULL,
    [UnitCost]                 DECIMAL (18, 2) NULL,
    [Quantity]                 DECIMAL (18, 2) NULL,
    [UnitPriceWithTaxes]       DECIMAL (18, 2) NULL,
    [UnitPrice]                DECIMAL (18, 2) NULL,
    [SubTotalCost]             DECIMAL (18, 2) NULL,
    [PriceBase]                INT             NULL,
    [SubTotalPrice]            DECIMAL (18, 2) NULL,
    [CurrencyID]               INT             NULL,
    [PriceBaseID]              INT             NULL,
    [RateToEuro]               DECIMAL (18, 2) NULL,
    [PriceInEuro]              DECIMAL (18, 2) NULL,
    [RateToOfferCurrency]      DECIMAL (18, 2) NULL,
    [PriceInOfferCurrency]     DECIMAL (18, 2) NULL,
    [ParentID]                 INT             NULL,
    [ItemDescription]          NVARCHAR (250)  NULL,
    [Margin]                   DECIMAL (5, 2)  NULL,
    CONSTRAINT [PK_CalculationSheetDetail] PRIMARY KEY CLUSTERED ([CalculationSheetDetailID] ASC),
    CONSTRAINT [FK_CalculationSheetDetail_CalculationSheet] FOREIGN KEY ([CalculationSheetID]) REFERENCES [dbo].[CalculationSheet] ([CalculationSheetID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_CalculationSheetDetail_CalculationSheetDetail1] FOREIGN KEY ([ParentID]) REFERENCES [dbo].[CalculationSheetDetail] ([CalculationSheetDetailID]),
    CONSTRAINT [FK_CalculationSheetDetail_Product] FOREIGN KEY ([ItemID]) REFERENCES [dbo].[Product] ([ProductID])
);
