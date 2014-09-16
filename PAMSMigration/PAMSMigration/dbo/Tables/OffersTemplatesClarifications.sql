CREATE TABLE [dbo].[OffersTemplatesClarifications] (
    [ID]                           INT           IDENTITY (1, 1) NOT NULL,
    [OfferTemplateID]              INT           NULL,
    [TypeOfSubmissionID]           INT           NULL,
    [SubmissionFrom]               NVARCHAR (50) NULL,
    [SubmittedPersone]             NVARCHAR (50) NULL,
    [ClarificationText]            NTEXT         NULL,
    [ClarificationDate]            DATETIME      NULL,
    [IsResponse]                   BIT           NULL,
    [OfferTemplateClarificationID] INT           NULL,
    [UserName]                     NVARCHAR (50) NULL,
    [ModifiedDate]                 DATETIME      NULL,
    CONSTRAINT [PK_OffersTemplateClarifications] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_OffersTemplatesClarifications_OffersTemplates] FOREIGN KEY ([OfferTemplateID]) REFERENCES [dbo].[OffersTemplates] ([ID]),
    CONSTRAINT [FK_OffersTemplatesClarifications_OffersTemplatesClarifictaionsSubmittedTypes] FOREIGN KEY ([TypeOfSubmissionID]) REFERENCES [dbo].[OffersTemplatesClarifictaionsSubmittedTypes] ([ID])
);

