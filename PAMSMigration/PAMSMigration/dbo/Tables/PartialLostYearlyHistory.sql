CREATE TABLE [dbo].[PartialLostYearlyHistory] (
    [PartialOrderYearlyHistoryID] INT             NOT NULL,
    [LostComment]                 NVARCHAR (100)  NULL,
    [WinnerName]                  NVARCHAR (150)  NULL,
    [WinnerPrice]                 MONEY           NULL,
    [WinnerPriceInEuro]           MONEY           NULL,
    [RateToEuro]                  DECIMAL (18, 2) NULL,
    [RateDate]                    DATETIME        NULL,
    [Comment]                     NTEXT           NULL,
    [UserName]                    NVARCHAR (50)   NULL,
    [ModifiedDate]                DATETIME        NULL,
    [WinnerPriceCurrencyID]       INT             NULL,
    [LostReasonID]                INT             NULL,
    CONSTRAINT [FK_PartialLostYearlyHistory_Currencies] FOREIGN KEY ([WinnerPriceCurrencyID]) REFERENCES [dbo].[Currencies] ([ID]),
    CONSTRAINT [FK_PartialLostYearlyHistory_LostReasons] FOREIGN KEY ([LostReasonID]) REFERENCES [dbo].[LostReasons] ([ID]),
    CONSTRAINT [FK_PartialLostYearlyHistory_PartialOrderYearlyHistory] FOREIGN KEY ([PartialOrderYearlyHistoryID]) REFERENCES [dbo].[PartialOrderYearlyHistory] ([PartialOrderYearlyHistoryID])
);

