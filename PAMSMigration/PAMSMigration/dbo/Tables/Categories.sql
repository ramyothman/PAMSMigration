CREATE TABLE [dbo].[Categories] (
    [CategoryID]          INT           IDENTITY (1, 1) NOT NULL,
    [CategoryName]        NVARCHAR (50) NULL,
    [CategoryDescription] NTEXT         NULL,
    [UserName]            NVARCHAR (50) NULL,
    [ModifiedDate]        DATETIME      NULL,
    [EgyptID]             INT           NULL,
    [RPEID]               INT           NULL,
    [QatarID]             INT           NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);

