CREATE TABLE [dbo].[OffersTemplatesItems] (
    [ID]              INT             IDENTITY (1, 1) NOT NULL,
    [OfferTemplateID] INT             NULL,
    [ItemNumber]      NVARCHAR (250)  NULL,
    [Item]            NVARCHAR (50)   NULL,
    [Description]     NVARCHAR (MAX)  NULL,
    [Qty]             INT             NULL,
    [UnitPrice]       DECIMAL (18, 4) NULL,
    [TotalPrice]      DECIMAL (18, 4) NULL,
    [UserName]        NVARCHAR (50)   NULL,
    [ModifiedDate]    DATETIME        NULL,
    CONSTRAINT [PK_OffersTemplatesItems] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_OffersTemplatesItems_OffersTemplates] FOREIGN KEY ([OfferTemplateID]) REFERENCES [dbo].[OffersTemplates] ([ID])
);

