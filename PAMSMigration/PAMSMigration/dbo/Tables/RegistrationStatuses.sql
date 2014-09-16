CREATE TABLE [dbo].[RegistrationStatuses] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [RegistrationStatus] NVARCHAR (50) NULL,
    CONSTRAINT [PK_RegistrationTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

