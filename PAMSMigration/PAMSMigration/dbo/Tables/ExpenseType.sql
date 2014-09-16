CREATE TABLE [dbo].[ExpenseType] (
    [ExpenseTypeID] INT            IDENTITY (1, 1) NOT NULL,
    [Name]          NVARCHAR (MAX) NULL,
    [IsIn]          BIT            NULL,
    CONSTRAINT [PK_ExpenseType] PRIMARY KEY CLUSTERED ([ExpenseTypeID] ASC)
);

