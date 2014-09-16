CREATE TABLE [dbo].[VacationTypes] (
    [VacationTypeId]   INT           IDENTITY (1, 1) NOT NULL,
    [VacationTypeName] NVARCHAR (50) NULL,
    [UserName]         NVARCHAR (50) NULL,
    [ModifiedDate]     DATETIME      NULL,
    CONSTRAINT [PK_VacationType] PRIMARY KEY CLUSTERED ([VacationTypeId] ASC)
);

