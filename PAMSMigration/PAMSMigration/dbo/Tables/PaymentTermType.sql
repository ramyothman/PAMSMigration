CREATE TABLE [dbo].[PaymentTermType] (
    [PaymentTermTypeID] INT           IDENTITY (1, 1) NOT NULL,
    [Name]              NVARCHAR (50) NULL,
    CONSTRAINT [PK_PaymentTermType] PRIMARY KEY CLUSTERED ([PaymentTermTypeID] ASC)
);

