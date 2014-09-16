CREATE TABLE [dbo].[Journals] (
    [JournalID]            INT             IDENTITY (1, 1) NOT NULL,
    [DebitValue]           DECIMAL (12, 2) NULL,
    [CreditValue]          DECIMAL (12, 2) NULL,
    [ExpenseID]            INT             NULL,
    [Date]                 DATETIME        NULL,
    [Notes]                NVARCHAR (MAX)  NULL,
    [CurrencyID]           INT             NULL,
    [RateToEuro]           DECIMAL (12, 2) NULL,
    [AmountInEuro]         DECIMAL (12, 2) NULL,
    [PaymentAccountTypeID] INT             NULL,
    [EmployeeID]           INT             NULL,
    [BankID]               INT             NULL,
    [TransactionID]        INT             NULL,
    CONSTRAINT [PK_Journals] PRIMARY KEY CLUSTERED ([JournalID] ASC),
    CONSTRAINT [FK_Journals_InComeExpenseClassification] FOREIGN KEY ([ExpenseID]) REFERENCES [dbo].[InComeExpenseClassification] ([InComeExpenseClassificationID])
);

