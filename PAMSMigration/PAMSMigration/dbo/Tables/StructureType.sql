CREATE TABLE [dbo].[StructureType] (
    [StructureTypeID] INT           IDENTITY (1, 1) NOT NULL,
    [StructureType]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_StructureType] PRIMARY KEY CLUSTERED ([StructureTypeID] ASC)
);

