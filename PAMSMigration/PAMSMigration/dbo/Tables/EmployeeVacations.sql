CREATE TABLE [dbo].[EmployeeVacations] (
    [EmployeeVacationID]  INT             IDENTITY (1, 1) NOT NULL,
    [PersonId]            INT             NULL,
    [VacationTypeId]      INT             NULL,
    [VacationReportWayID] INT             NULL,
    [StartDate]           DATETIME        NULL,
    [EndDate]             DATETIME        NULL,
    [RequestDate]         DATETIME        NULL,
    [ApprovedDate]        DATETIME        NULL,
    [ApprovedPersonId]    INT             NULL,
    [IsApproved]          BIT             NULL,
    [NumOfDays]           NUMERIC (18, 1) NULL,
    [Comment]             NVARCHAR (MAX)  NULL,
    [ModifiedDate]        DATETIME        NULL,
    [UserName]            NVARCHAR (50)   NULL,
    CONSTRAINT [PK_EmployeeVacations] PRIMARY KEY CLUSTERED ([EmployeeVacationID] ASC),
    CONSTRAINT [FK_EmployeeVacations_Employees] FOREIGN KEY ([PersonId]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityId]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_EmployeeVacations_VacationType] FOREIGN KEY ([VacationTypeId]) REFERENCES [dbo].[VacationTypes] ([VacationTypeId]) ON UPDATE CASCADE
);

