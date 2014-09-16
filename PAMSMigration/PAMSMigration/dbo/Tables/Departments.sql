CREATE TABLE [dbo].[Departments] (
    [DepartmentId]       INT           IDENTITY (1, 1) NOT NULL,
    [DepartmentName]     NVARCHAR (50) NULL,
    [ParentDepartmentId] INT           NULL,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED ([DepartmentId] ASC)
);

