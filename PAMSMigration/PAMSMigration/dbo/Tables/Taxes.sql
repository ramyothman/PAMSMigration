CREATE TABLE [dbo].[Taxes] (
    [TaxID]     INT             IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (50)   NULL,
    [Amount]    DECIMAL (18, 2) NULL,
    [IsPercent] BIT             NULL,
    CONSTRAINT [PK_Taxes] PRIMARY KEY CLUSTERED ([TaxID] ASC)
);

