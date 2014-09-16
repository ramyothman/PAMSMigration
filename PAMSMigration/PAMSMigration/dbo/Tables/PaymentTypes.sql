CREATE TABLE [dbo].[PaymentTypes] (
    [PaymentType]            NVARCHAR (50) NOT NULL,
    [PaymentTypeDescription] NTEXT         NULL,
    [ID]                     INT           IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

