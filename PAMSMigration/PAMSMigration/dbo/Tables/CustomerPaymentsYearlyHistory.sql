﻿CREATE TABLE [dbo].[CustomerPaymentsYearlyHistory] (
    [CustomerPaymentID]         INT             NOT NULL,
    [InquiryNumber]             NVARCHAR (100)  NULL,
    [PaymentNumber]             INT             NOT NULL,
    [PaidAmount]                DECIMAL (18, 2) NULL,
    [ONDate]                    DATETIME        NULL,
    [SumPaid]                   DECIMAL (18, 2) NULL,
    [Deduction]                 BIT             NULL,
    [DeductionNumber]           INT             NULL,
    [DeductionAmount]           DECIMAL (18, 2) NULL,
    [Reason]                    NTEXT           NULL,
    [SumDeduction]              DECIMAL (18, 2) NULL,
    [RestPayment]               DECIMAL (18, 2) NULL,
    [Comment]                   NTEXT           NULL,
    [UserName]                  NVARCHAR (100)  NULL,
    [ModifiedDate]              DATETIME        NULL,
    [PaidAmountRateToEuro]      DECIMAL (18, 2) NULL,
    [PaidAmountInEuro]          DECIMAL (18, 2) NULL,
    [PaidAmountRateDate]        DATETIME        NULL,
    [DeductionAmountRateToEuro] DECIMAL (18, 2) NULL,
    [DeductionAmountInEuro]     DECIMAL (18, 2) NULL,
    [DeductionAmountRateDate]   DATETIME        NULL,
    [PaidAmountCurrencyID]      INT             NULL,
    [DeductionAmountCurrencyID] INT             NULL,
    [InvoiceNumber]             NVARCHAR (100)  NULL,
    CONSTRAINT [PK_CustomerPaymentsYearlyHistory] PRIMARY KEY CLUSTERED ([CustomerPaymentID] ASC)
);

