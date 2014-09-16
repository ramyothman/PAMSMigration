CREATE TABLE [dbo].[SubCommissions] (
    [SubCommissionID]            INT           IDENTITY (1, 1) NOT NULL,
    [InquiryNumber]              NVARCHAR (50) NULL,
    [AgentID]                    INT           NULL,
    [PriceCommissionBase]        DECIMAL (18)  NULL,
    [PercentPriceCommissionBase] NUMERIC (18)  NULL,
    [SubCommissionPercent]       NUMERIC (18)  NULL,
    [SubCommissionAmount]        DECIMAL (18)  NULL,
    [CurrencyID]                 INT           NULL,
    [RateToEuro]                 NUMERIC (18)  NULL,
    [ONDate]                     DATETIME      NULL,
    [SubCommissionAmountInEuro]  DECIMAL (18)  NULL,
    [Reason]                     NTEXT         NULL,
    [UserName]                   NVARCHAR (50) NULL,
    [ModifiedDate]               DATETIME      NULL,
    CONSTRAINT [PK_SubCommissions] PRIMARY KEY CLUSTERED ([SubCommissionID] ASC),
    CONSTRAINT [FK_SubCommissions_Currencies] FOREIGN KEY ([CurrencyID]) REFERENCES [dbo].[Currencies] ([ID])
);

