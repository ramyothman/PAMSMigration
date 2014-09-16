CREATE TABLE [dbo].[TimePeriod] (
    [TimePeriodID] INT           NOT NULL,
    [PeriodName]   NVARCHAR (50) NULL,
    [PeriodDays]   INT           NULL,
    CONSTRAINT [PK_TimePeriod] PRIMARY KEY CLUSTERED ([TimePeriodID] ASC)
);

