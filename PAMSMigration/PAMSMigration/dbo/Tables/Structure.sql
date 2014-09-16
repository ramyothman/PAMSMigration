CREATE TABLE [dbo].[Structure] (
    [StructureID]      INT   IDENTITY (1, 1) NOT NULL,
    [StructureTypeID]  INT   NULL,
    [BusinessEntityID] INT   NULL,
    [AttributeID]      INT   NULL,
    [AttributeValue]   NTEXT NULL,
    [ViewTypeID]       INT   NULL,
    CONSTRAINT [PK_Structure] PRIMARY KEY CLUSTERED ([StructureID] ASC),
    CONSTRAINT [FK_Structure_BusinessEntity] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityId]),
    CONSTRAINT [FK_Structure_StructureAttributes] FOREIGN KEY ([AttributeID]) REFERENCES [dbo].[StructureAttributes] ([AttributeID]),
    CONSTRAINT [FK_Structure_StructureType] FOREIGN KEY ([StructureTypeID]) REFERENCES [dbo].[StructureType] ([StructureTypeID]),
    CONSTRAINT [FK_Structure_StructureViewType] FOREIGN KEY ([ViewTypeID]) REFERENCES [dbo].[StructureViewType] ([ViewTypeID])
);

