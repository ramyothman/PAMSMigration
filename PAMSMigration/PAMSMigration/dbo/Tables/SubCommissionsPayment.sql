CREATE TABLE [dbo].[SubCommissionsPayment] (
    [SubCommissionID]                  INT           NOT NULL,
    [SubCommissionPaymentNumber]       INT           NOT NULL,
    [PaidSubCommissionAmount]          DECIMAL (18)  NULL,
    [ONDate]                           DATETIME      NULL,
    [CurrencyID]                       INT           NULL,
    [RateToEuro]                       NUMERIC (18)  NULL,
    [PaidSubCommissionAmountInEuro]    DECIMAL (18)  NULL,
    [SumPaidSubCommissionAmountInEuro] DECIMAL (18)  NULL,
    [DueSubCommissionAmountInEuro]     DECIMAL (18)  NULL,
    [Comment]                          NTEXT         NULL,
    [UserName]                         NVARCHAR (50) NULL,
    [BankID]                           INT           NULL,
    [ModifiedDate]                     DATETIME      NULL,
    CONSTRAINT [PK_SubCommissionsPayment] PRIMARY KEY CLUSTERED ([SubCommissionID] ASC, [SubCommissionPaymentNumber] ASC),
    CONSTRAINT [FK_SubCommissionsPayment_Banks] FOREIGN KEY ([BankID]) REFERENCES [dbo].[Banks] ([ID]),
    CONSTRAINT [FK_SubCommissionsPayment_Currencies] FOREIGN KEY ([CurrencyID]) REFERENCES [dbo].[Currencies] ([ID])
);

