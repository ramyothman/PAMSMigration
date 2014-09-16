CREATE TABLE [dbo].[PeriodType] (
    [PeriodTypeID] INT            IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (MAX) NULL,
    [DaysNo]       INT            NULL,
    CONSTRAINT [PK_PeriodType] PRIMARY KEY CLUSTERED ([PeriodTypeID] ASC)
);

