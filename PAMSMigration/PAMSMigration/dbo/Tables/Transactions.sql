CREATE TABLE [dbo].[Transactions] (
    [TransactionID]   NVARCHAR (50)   NOT NULL,
    [SupplierID]      INT             NULL,
    [InquiryCode]     NVARCHAR (50)   NULL,
    [Amount]          MONEY           NULL,
    [CurrencyID]      INT             NULL,
    [BankID]          INT             NULL,
    [TransactionDate] DATETIME        NULL,
    [Reason]          NVARCHAR (600)  NULL,
    [Reference]       NVARCHAR (600)  NULL,
    [RateToEuro]      NUMERIC (18, 4) NULL,
    [AmountInEuro]    MONEY           NULL,
    [BranchID]        INT             NULL,
    [EgyptID]         NVARCHAR (50)   NULL,
    [RPEID]           NVARCHAR (50)   NULL,
    [QatarID]         NVARCHAR (50)   NULL,
    CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED ([TransactionID] ASC),
    CONSTRAINT [FK_Transactions_Banks] FOREIGN KEY ([BankID]) REFERENCES [dbo].[Banks] ([ID]),
    CONSTRAINT [FK_Transactions_Currencies] FOREIGN KEY ([CurrencyID]) REFERENCES [dbo].[Currencies] ([ID])
);

