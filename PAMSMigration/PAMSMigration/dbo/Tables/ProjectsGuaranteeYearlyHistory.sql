CREATE TABLE [dbo].[ProjectsGuaranteeYearlyHistory] (
    [ID]                         INT             NOT NULL,
    [GuaranteeNumber]            NVARCHAR (50)   NULL,
    [InquiryNumber]              NVARCHAR (50)   NULL,
    [GuaranteeTypeID]            INT             NULL,
    [PercentageFromOffer]        DECIMAL (18, 4) NULL,
    [Amount]                     DECIMAL (18, 4) NULL,
    [IssuingDate]                DATETIME        NULL,
    [BankBranch]                 NVARCHAR (50)   NULL,
    [Remarks]                    NVARCHAR (MAX)  NULL,
    [GuaranteeCopy]              IMAGE           NULL,
    [NextStepID]                 INT             NULL,
    [GuaranteeCurrentLocationID] INT             NULL,
    [UserName]                   NVARCHAR (50)   NULL,
    [ModifiedDate]               DATETIME        NULL,
    [ExpiryDate]                 DATETIME        NULL,
    [IsActive]                   BIT             NULL,
    [IssuingBy]                  INT             NULL,
    [CalculationMethod]          NVARCHAR (50)   NULL,
    [CurrencyID]                 INT             NULL,
    [BankID]                     INT             NULL,
    [InActiveDate]               DATETIME        NULL
);

