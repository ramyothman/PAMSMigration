CREATE TABLE [dbo].[Products] (
    [ProductID]          INT           IDENTITY (1, 1) NOT NULL,
    [CategoryID]         INT           NULL,
    [ProductName]        NVARCHAR (50) NULL,
    [ProductDescription] NTEXT         NULL,
    [IsActive]           BIT           NULL,
    [UserName]           NVARCHAR (50) NULL,
    [ModifiedDate]       DATETIME      NULL,
    [BranchID]           INT           NULL,
    [EgyptID]            INT           NULL,
    [RPEID]              INT           NULL,
    [QatarID]            INT           NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID]) ON DELETE CASCADE ON UPDATE CASCADE
);

