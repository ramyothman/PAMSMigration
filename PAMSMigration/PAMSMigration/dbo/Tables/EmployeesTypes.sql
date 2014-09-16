CREATE TABLE [dbo].[EmployeesTypes] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [EmployeeTypeName] NVARCHAR (50) NULL,
    CONSTRAINT [PK_EmployeesTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

