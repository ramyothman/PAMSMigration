CREATE TABLE [dbo].[Currencies] (
    [CurrencyCode]   NVARCHAR (50) NOT NULL,
    [CurrencyName]   NVARCHAR (50) NULL,
    [CurrencyNameSL] NVARCHAR (50) NULL,
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [EgyptID]        INT           NULL,
    [RPEID]          INT           NULL,
    [QatarID]        INT           NULL,
    CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED ([ID] ASC)
);

