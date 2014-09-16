CREATE TABLE [dbo].[Stock] (
    [StockID]     INT IDENTITY (1, 1) NOT NULL,
    [ItemID]      INT NULL,
    [INQuantity]  INT NULL,
    [OutQuantity] INT NULL,
    CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED ([StockID] ASC)
);

