CREATE TABLE [dbo].[StructureAttributes] (
    [AttributeID]     INT           IDENTITY (1, 1) NOT NULL,
    [AttributeName]   NVARCHAR (75) NULL,
    [ParentAttribute] INT           NULL,
    CONSTRAINT [PK_StructureAttributes] PRIMARY KEY CLUSTERED ([AttributeID] ASC)
);

