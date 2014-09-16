CREATE TABLE [dbo].[OffersTemplatesClarificationsResponses] (
    [ID]                           INT           IDENTITY (1, 1) NOT NULL,
    [OfferTemplateClarificationID] INT           NULL,
    [ResponseText]                 NTEXT         NULL,
    [ResponseOfferTemplateID]      INT           NULL,
    [ResponseBy]                   NVARCHAR (50) NULL,
    [UserName]                     NVARCHAR (50) NULL,
    [ModifiedDate]                 DATETIME      NULL,
    CONSTRAINT [PK_OffersTemplatesClarificationsResponses] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_OffersTemplatesClarificationsResponses_OffersTemplates] FOREIGN KEY ([ResponseOfferTemplateID]) REFERENCES [dbo].[OffersTemplates] ([ID]),
    CONSTRAINT [FK_OffersTemplatesClarificationsResponses_OffersTemplatesClarifications] FOREIGN KEY ([OfferTemplateClarificationID]) REFERENCES [dbo].[OffersTemplatesClarifications] ([ID])
);

