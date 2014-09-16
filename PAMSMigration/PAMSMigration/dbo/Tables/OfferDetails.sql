CREATE TABLE [dbo].[OfferDetails] (
    [OfferDetailsID]       INT             IDENTITY (1, 1) NOT NULL,
    [OfferID]              INT             NULL,
    [Price]                DECIMAL (18, 2) NULL,
    [PriceWithTaxes]       DECIMAL (18, 2) NULL,
    [RateToEuro]           DECIMAL (18, 2) NULL,
    [PriceInEuro]          DECIMAL (18, 2) NULL,
    [PriceWithTaxesInEuro] DECIMAL (18, 2) NULL,
    [Discount]             DECIMAL (18, 2) NULL,
    [DiscountInEuro]       DECIMAL (18, 2) NULL,
    [CurrencyID]           INT             NULL,
    [IsOrdered]            BIT             NULL,
    [Qty]                  INT             NULL,
    [ItemID]               INT             NULL,
    CONSTRAINT [PK_OfferDetails] PRIMARY KEY CLUSTERED ([OfferDetailsID] ASC),
    CONSTRAINT [FK_OfferDetails_Offers] FOREIGN KEY ([OfferID]) REFERENCES [dbo].[Offers] ([OfferID]) ON DELETE CASCADE ON UPDATE CASCADE
);

