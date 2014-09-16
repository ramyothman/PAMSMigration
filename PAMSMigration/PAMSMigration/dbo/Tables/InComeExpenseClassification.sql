CREATE TABLE [dbo].[InComeExpenseClassification] (
    [InComeExpenseClassificationID]  INT            IDENTITY (1, 1) NOT NULL,
    [InComeExpenseClassificationID2] INT            NULL,
    [Name]                           NVARCHAR (MAX) NULL,
    [HasOpenBalance]                 BIT            NULL,
    [IsDebit]                        BIT            NULL,
    [CurrencyID]                     INT            NULL,
    [IsClient]                       BIT            NULL,
    [IsSupplier]                     BIT            NULL,
    [IsJob]                          BIT            NULL,
    CONSTRAINT [PK_InComeExpenseClassification] PRIMARY KEY CLUSTERED ([InComeExpenseClassificationID] ASC),
    CONSTRAINT [FK_InComeExpenseClassification_InComeExpenseClassification] FOREIGN KEY ([InComeExpenseClassificationID2]) REFERENCES [dbo].[InComeExpenseClassification] ([InComeExpenseClassificationID])
);

