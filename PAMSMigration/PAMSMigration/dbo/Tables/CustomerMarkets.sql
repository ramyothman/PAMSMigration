CREATE TABLE [dbo].[CustomerMarkets] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [CustomerMarket] NVARCHAR (250) NULL,
    [UserName]       NVARCHAR (50)  NULL,
    [ModifiedDate]   DATETIME       NULL,
    CONSTRAINT [PK_CustomerMarket] PRIMARY KEY CLUSTERED ([ID] ASC)
);

