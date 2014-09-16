CREATE TABLE [dbo].[ProductColumns] (
    [ID]       INT           IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (50) NULL,
    [Caption]  NVARCHAR (50) NULL,
    [TypeName] NVARCHAR (50) NULL,
    CONSTRAINT [PK_ProductColumns] PRIMARY KEY CLUSTERED ([ID] ASC)
);

