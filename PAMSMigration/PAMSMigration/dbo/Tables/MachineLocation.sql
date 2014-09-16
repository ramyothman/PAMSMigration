CREATE TABLE [dbo].[MachineLocation] (
    [MachineLocationId]   INT           IDENTITY (1, 1) NOT NULL,
    [MachineLocationName] NVARCHAR (50) NULL,
    CONSTRAINT [PK_MachineLocation] PRIMARY KEY CLUSTERED ([MachineLocationId] ASC)
);

