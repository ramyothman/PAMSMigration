CREATE TABLE [dbo].[PivotStructure] (
    [PivotStructureID] INT            IDENTITY (1, 1) NOT NULL,
    [PersonID]         INT            NULL,
    [Name]             NVARCHAR (50)  NULL,
    [Description]      NVARCHAR (500) NULL,
    [StructureXML]     NTEXT          NULL,
    CONSTRAINT [PK_PivotStructure] PRIMARY KEY CLUSTERED ([PivotStructureID] ASC)
);

