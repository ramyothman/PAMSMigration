CREATE TABLE [dbo].[SystemFunctions] (
    [ID]       INT           IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (50) NULL,
    [IsActive] BIT           NULL,
    CONSTRAINT [PK_SystemFunctions] PRIMARY KEY CLUSTERED ([ID] ASC)
);

