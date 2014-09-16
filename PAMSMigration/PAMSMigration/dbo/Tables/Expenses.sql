CREATE TABLE [dbo].[Expenses] (
    [ExpenseID]     INT             IDENTITY (1, 1) NOT NULL,
    [Name]          NVARCHAR (MAX)  NULL,
    [IsFixed]       BIT             NULL,
    [ExpenseTypeID] INT             NULL,
    [PeriodTypeID]  INT             NULL,
    [RepeatationNo] INT             NULL,
    [StartDate]     DATETIME        NULL,
    [EndDate]       DATETIME        NULL,
    [Value]         DECIMAL (12, 2) NULL,
    [CurrencyID]    INT             NULL,
    [EmployeeID]    INT             NULL,
    CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED ([ExpenseID] ASC),
    CONSTRAINT [FK_Expenses_ExpenseType] FOREIGN KEY ([ExpenseTypeID]) REFERENCES [dbo].[ExpenseType] ([ExpenseTypeID]),
    CONSTRAINT [FK_Expenses_PeriodType] FOREIGN KEY ([PeriodTypeID]) REFERENCES [dbo].[PeriodType] ([PeriodTypeID])
);

