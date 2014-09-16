CREATE TABLE [dbo].[Holiday] (
    [HolidayId]   INT           IDENTITY (1, 1) NOT NULL,
    [HolidayName] NVARCHAR (50) NULL,
    CONSTRAINT [PK_Holiday] PRIMARY KEY CLUSTERED ([HolidayId] ASC)
);

