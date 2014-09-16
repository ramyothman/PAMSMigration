CREATE TABLE [dbo].[CalculationSheet] (
    [CalculationSheetID]   INT             IDENTITY (1, 1) NOT NULL,
    [InquiryNumber]        NVARCHAR (50)   NULL,
    [OfferCurrencyID]      INT             NULL,
    [RiskFactorPercentage] DECIMAL (18, 2) NULL,
    [Margin]               DECIMAL (18, 2) NULL,
    [RequiredDestination]  INT             NULL,
    [Memo]                 NTEXT           NULL,
    [Reference]            NVARCHAR (150)  NULL,
    [TotalWithoutTaxes]    DECIMAL (18, 2) NULL,
    [Deduction]            DECIMAL (18, 2) NULL,
    [Total]                DECIMAL (18, 2) NULL,
    [SheetDate]            DATETIME        NULL,
    [SalesTax]             DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_CalculationSheet] PRIMARY KEY CLUSTERED ([CalculationSheetID] ASC),
    CONSTRAINT [FK_CalculationSheet_Inquiries] FOREIGN KEY ([InquiryNumber]) REFERENCES [dbo].[Inquiries] ([InquiryNumber]) ON DELETE CASCADE ON UPDATE CASCADE
);

