CREATE TABLE [dbo].[Machines] (
    [MachineId]         INT           IDENTITY (1, 1) NOT NULL,
    [MachineName]       NVARCHAR (50) NULL,
    [MachineIP]         NVARCHAR (50) NULL,
    [MachinePort]       INT           NULL,
    [MachineRefDate]    DATETIME      NULL,
    [FirmwareVersion]   NVARCHAR (50) NULL,
    [MachineType]       NVARCHAR (50) NULL,
    [MachineLocationId] INT           NULL,
    [MachineNumber]     NVARCHAR (50) NULL,
    CONSTRAINT [PK_Machines] PRIMARY KEY CLUSTERED ([MachineId] ASC),
    CONSTRAINT [FK_Machines_MachineLocation] FOREIGN KEY ([MachineLocationId]) REFERENCES [dbo].[MachineLocation] ([MachineLocationId]) ON DELETE CASCADE ON UPDATE CASCADE
);

