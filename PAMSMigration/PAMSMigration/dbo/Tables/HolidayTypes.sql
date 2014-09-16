CREATE TABLE [dbo].[HolidayTypes] (
    [HolidayTypeId]   INT           IDENTITY (1, 1) NOT NULL,
    [HolidayTypeName] NVARCHAR (50) NULL,
    CONSTRAINT [PK_HolidayTypes] PRIMARY KEY CLUSTERED ([HolidayTypeId] ASC)
);

