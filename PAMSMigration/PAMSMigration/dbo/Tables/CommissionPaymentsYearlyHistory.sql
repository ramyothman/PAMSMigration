CREATE TABLE [dbo].[CommissionPaymentsYearlyHistory] (
    [InquiryNumber]                 NVARCHAR (50)   NOT NULL,
    [TransactionID]                 NVARCHAR (50)   NOT NULL,
    [CommissionPaymentNumber]       INT             NOT NULL,
    [PaidCommissionAmount]          MONEY           NULL,
    [ONDate]                        DATETIME        NULL,
    [RateToEuro]                    DECIMAL (18, 2) NULL,
    [PaidCommissionAmountInEuro]    MONEY           CONSTRAINT [DF_CommissionPaymentsYearlyHistory_PaidCommissionAmountInEuro] DEFAULT ((0)) NULL,
    [SumPaidCommissionAmountInEuro] MONEY           NULL,
    [DueCommissionAmountInEuro]     MONEY           NULL,
    [Comment]                       NTEXT           NULL,
    [UserName]                      NVARCHAR (50)   NULL,
    [ModifiedDate]                  DATETIME        NULL,
    [CurrencyID]                    INT             NULL,
    [BankID]                        INT             NULL,
    CONSTRAINT [PK_CommissionPaymentsYearlyHistory] PRIMARY KEY CLUSTERED ([InquiryNumber] ASC, [TransactionID] ASC, [CommissionPaymentNumber] ASC),
    CONSTRAINT [FK_CommissionPaymentsYearlyHistory_Banks] FOREIGN KEY ([BankID]) REFERENCES [dbo].[Banks] ([ID]),
    CONSTRAINT [FK_CommissionPaymentsYearlyHistory_CommissionsYearlyHistory] FOREIGN KEY ([InquiryNumber]) REFERENCES [dbo].[CommissionsYearlyHistory] ([InquiryNumber]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_CommissionPaymentsYearlyHistory_Currencies] FOREIGN KEY ([CurrencyID]) REFERENCES [dbo].[Currencies] ([ID])
);

