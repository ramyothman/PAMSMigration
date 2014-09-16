CREATE TABLE [dbo].[OffersTemplatesFiles] (
    [ID]                           INT            IDENTITY (1, 1) NOT NULL,
    [OfferTemplateClarificationID] INT            NULL,
    [ResponseID]                   INT            NULL,
    [AttachedFile]                 IMAGE          NULL,
    [AttachedFileName]             NVARCHAR (100) NULL,
    [Comment]                      NVARCHAR (50)  NULL,
    [UserName]                     NVARCHAR (50)  NULL,
    [ModifiedDate]                 DATETIME       NULL,
    CONSTRAINT [PK_OffersTemplatesFiles] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_OffersTemplatesFiles_OffersTemplatesClarifications] FOREIGN KEY ([OfferTemplateClarificationID]) REFERENCES [dbo].[OffersTemplatesClarifications] ([ID]),
    CONSTRAINT [FK_OffersTemplatesFiles_OffersTemplatesClarificationsResponses] FOREIGN KEY ([ResponseID]) REFERENCES [dbo].[OffersTemplatesClarificationsResponses] ([ID])
);

