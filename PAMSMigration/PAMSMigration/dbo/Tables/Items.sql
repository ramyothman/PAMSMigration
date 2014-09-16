CREATE TABLE [dbo].[Items] (
    [ItemID]          INT             IDENTITY (1, 1) NOT NULL,
    [Name]            NVARCHAR (MAX)  NULL,
    [CategoryID]      INT             NULL,
    [ProductTypeID]   INT             NULL,
    [CostPrice]       DECIMAL (18, 2) NULL,
    [CurrencyID]      INT             NULL,
    [RateToEuro]      DECIMAL (18, 2) NULL,
    [CostPriceInEuro] DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED ([ItemID] ASC)
);

