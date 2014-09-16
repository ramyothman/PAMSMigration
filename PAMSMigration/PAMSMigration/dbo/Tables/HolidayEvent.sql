CREATE TABLE [dbo].[HolidayEvent] (
    [HolidayEventId]        INT      IDENTITY (1, 1) NOT NULL,
    [HolidayId]             INT      NULL,
    [HolidayTypeId]         INT      NULL,
    [HolidayStartDate]      DATETIME NULL,
    [HolidayDurationInDays] INT      NULL,
    [HolidayEndDate]        DATETIME NULL,
    [DepartmentId]          INT      NULL,
    [ModifiedDate]          DATETIME NULL,
    CONSTRAINT [PK_HolidayEvent] PRIMARY KEY CLUSTERED ([HolidayEventId] ASC),
    CONSTRAINT [FK_HolidayEvent_Departments] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Departments] ([DepartmentId]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_HolidayEvent_Holiday] FOREIGN KEY ([HolidayId]) REFERENCES [dbo].[Holiday] ([HolidayId]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_HolidayEvent_HolidayTypes] FOREIGN KEY ([HolidayTypeId]) REFERENCES [dbo].[HolidayTypes] ([HolidayTypeId]) ON DELETE CASCADE ON UPDATE CASCADE
);

