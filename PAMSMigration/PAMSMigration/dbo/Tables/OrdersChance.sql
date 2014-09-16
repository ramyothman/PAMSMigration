CREATE TABLE [dbo].[OrdersChance] (
    [ID]           INT           NOT NULL,
    [OrderChance]  NVARCHAR (50) NULL,
    [UserName]     NVARCHAR (50) NULL,
    [ModifiedDate] DATETIME      NULL,
    CONSTRAINT [PK_OrdersChance] PRIMARY KEY CLUSTERED ([ID] ASC)
);

