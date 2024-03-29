﻿CREATE TABLE [dbo].[ProjectsGuarantee] (
    [ID]                         INT             IDENTITY (1, 1) NOT NULL,
    [GuaranteeNumber]            NVARCHAR (50)   NULL,
    [InquiryNumber]              NVARCHAR (50)   NULL,
    [GuaranteeTypeID]            INT             NULL,
    [PercentageFromOffer]        DECIMAL (18, 4) NULL,
    [Amount]                     DECIMAL (18, 4) NULL,
    [CurrencyID]                 INT             NULL,
    [IssuingDate]                DATETIME        NULL,
    [BankID]                     INT             NULL,
    [BankBranch]                 NVARCHAR (50)   NULL,
    [Remarks]                    NVARCHAR (MAX)  NULL,
    [GuaranteeCopy]              IMAGE           NULL,
    [NextStepID]                 INT             NULL,
    [GuaranteeCurrentLocationID] INT             NULL,
    [UserName]                   NVARCHAR (50)   NULL,
    [ModifiedDate]               DATETIME        NULL,
    [ExpiryDate]                 DATETIME        NULL,
    [IsActive]                   BIT             NULL,
    [InActiveDate]               DATETIME        NULL,
    [IssuingBy]                  INT             NULL,
    [CalculationMethod]          NVARCHAR (50)   NULL,
    [RatetoEuro]                 DECIMAL (18, 2) NULL,
    [AmountinEuro]               DECIMAL (18, 2) NULL,
    [GuaranteeStatusID]          INT             NULL,
    [EgyptID]                    INT             NULL,
    [RPEID]                      INT             NULL,
    [QatarID]                    INT             NULL,
    [Validity]                   INT             NULL,
    [TimePeriodID]               INT             NULL,
    CONSTRAINT [PK_ProjectsGurantees] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProjectsGuarantee_Banks] FOREIGN KEY ([BankID]) REFERENCES [dbo].[Banks] ([ID]),
    CONSTRAINT [FK_ProjectsGuarantee_Currencies] FOREIGN KEY ([CurrencyID]) REFERENCES [dbo].[Currencies] ([ID]),
    CONSTRAINT [FK_ProjectsGurantees_GuaranteeDistinations] FOREIGN KEY ([GuaranteeCurrentLocationID]) REFERENCES [dbo].[GuaranteeDistinations] ([ID]),
    CONSTRAINT [FK_ProjectsGurantees_GuranteeTypes] FOREIGN KEY ([GuaranteeTypeID]) REFERENCES [dbo].[GuaranteeTypes] ([ID]),
    CONSTRAINT [FK_ProjectsGurantees_GuranteeTypes1] FOREIGN KEY ([NextStepID]) REFERENCES [dbo].[GuaranteeTypes] ([ID]),
    CONSTRAINT [FK_ProjectsGurantees_Inquiries] FOREIGN KEY ([InquiryNumber]) REFERENCES [dbo].[Inquiries] ([InquiryNumber]) ON DELETE CASCADE ON UPDATE CASCADE
);

