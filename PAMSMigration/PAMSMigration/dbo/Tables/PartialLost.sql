CREATE TABLE [dbo].[PartialLost] (
    [PartialOrderID]        INT             NOT NULL,
    [LostReasonID]          INT             NULL,
    [LostComment]           NVARCHAR (100)  NULL,
    [WinnerName]            NVARCHAR (150)  NULL,
    [WinnerPrice]           MONEY           NULL,
    [WinnerPriceInEuro]     MONEY           NULL,
    [RateToEuro]            DECIMAL (18, 2) NULL,
    [RateDate]              DATETIME        NULL,
    [WinnerPriceCurrencyID] INT             NULL,
    [Comment]               NTEXT           NULL,
    [UserName]              NVARCHAR (50)   NULL,
    [ModifiedDate]          DATETIME        NULL,
    CONSTRAINT [PK_PartialLost] PRIMARY KEY CLUSTERED ([PartialOrderID] ASC),
    CONSTRAINT [FK_PartialLost_Currencies] FOREIGN KEY ([WinnerPriceCurrencyID]) REFERENCES [dbo].[Currencies] ([ID]),
    CONSTRAINT [FK_PartialLost_LostReasons] FOREIGN KEY ([LostReasonID]) REFERENCES [dbo].[LostReasons] ([ID]),
    CONSTRAINT [FK_PartialLost_PartialOrder] FOREIGN KEY ([PartialOrderID]) REFERENCES [dbo].[PartialOrder] ([PartialOrderID])
);

