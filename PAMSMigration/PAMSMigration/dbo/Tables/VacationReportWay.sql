CREATE TABLE [dbo].[VacationReportWay] (
    [ID]                    INT           IDENTITY (1, 1) NOT NULL,
    [VacationReportWayName] NVARCHAR (50) NULL,
    [UserName]              NVARCHAR (50) NULL,
    [ModifiedDate]          DATETIME      NULL,
    CONSTRAINT [PK_VacationReasons] PRIMARY KEY CLUSTERED ([ID] ASC)
);

