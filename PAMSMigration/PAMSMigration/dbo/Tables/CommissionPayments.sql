CREATE TABLE [dbo].[CommissionPayments] (
    [InquiryNumber]                 NVARCHAR (50)   NOT NULL,
    [TransactionID]                 NVARCHAR (50)   NOT NULL,
    [CommissionPaymentNumber]       INT             NOT NULL,
    [PaidCommissionAmount]          MONEY           NULL,
    [ONDate]                        DATETIME        NULL,
    [CurrencyID]                    INT             NULL,
    [RateToEuro]                    DECIMAL (18, 2) NULL,
    [PaidCommissionAmountInEuro]    MONEY           CONSTRAINT [DF_CommissionPayments_PaidCommissionAmountInEuro] DEFAULT ((0)) NULL,
    [SumPaidCommissionAmountInEuro] MONEY           NULL,
    [DueCommissionAmountInEuro]     MONEY           NULL,
    [Comment]                       NTEXT           NULL,
    [UserName]                      NVARCHAR (50)   NULL,
    [BankID]                        INT             NULL,
    [ModifiedDate]                  DATETIME        NULL,
    [IsPaid]                        BIT             NULL,
    CONSTRAINT [PK_CommissionPayments] PRIMARY KEY CLUSTERED ([InquiryNumber] ASC, [TransactionID] ASC, [CommissionPaymentNumber] ASC),
    CONSTRAINT [FK_CommissionPayments_Banks] FOREIGN KEY ([BankID]) REFERENCES [dbo].[Banks] ([ID]),
    CONSTRAINT [FK_CommissionPayments_Currencies] FOREIGN KEY ([CurrencyID]) REFERENCES [dbo].[Currencies] ([ID])
);

