CREATE TABLE [dbo].[PaymentAccountType] (
    [PaymentAccountTypeID] INT            IDENTITY (1, 1) NOT NULL,
    [Name]                 NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_PaymentAccountType] PRIMARY KEY CLUSTERED ([PaymentAccountTypeID] ASC)
);

