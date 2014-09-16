CREATE TABLE [dbo].[PaymentTerms] (
    [PaymentTermID]     INT             IDENTITY (1, 1) NOT NULL,
    [PaymentTermTypeID] INT             NULL,
    [IsJobDownPayment]  BIT             NULL,
    [IsJobInProgress]   BIT             NULL,
    [IsJobCompleted]    BIT             NULL,
    [IsReached]         BIT             NULL,
    [IsPaid]            BIT             NULL,
    [PercentageValue]   DECIMAL (18, 2) NULL,
    [Description]       NVARCHAR (500)  NULL,
    [InquiryNumber]     NVARCHAR (50)   NULL,
    CONSTRAINT [PK_PaymentTerms] PRIMARY KEY CLUSTERED ([PaymentTermID] ASC),
    CONSTRAINT [FK_PaymentTerms_Inquiries] FOREIGN KEY ([InquiryNumber]) REFERENCES [dbo].[Inquiries] ([InquiryNumber]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_PaymentTerms_PaymentTermType] FOREIGN KEY ([PaymentTermTypeID]) REFERENCES [dbo].[PaymentTermType] ([PaymentTermTypeID])
);

