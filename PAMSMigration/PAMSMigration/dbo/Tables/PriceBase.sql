CREATE TABLE [dbo].[PriceBase] (
    [PriceBaseCode]        NVARCHAR (50) NOT NULL,
    [PriceBaseName]        NVARCHAR (50) NULL,
    [PriceBaseDescription] NTEXT         NULL,
    [ID]                   INT           IDENTITY (1, 1) NOT NULL,
    [EgyptID]              INT           NULL,
    [RPEID]                INT           NULL,
    [QatarID]              INT           NULL,
    CONSTRAINT [PK_PriceBase] PRIMARY KEY CLUSTERED ([ID] ASC)
);

