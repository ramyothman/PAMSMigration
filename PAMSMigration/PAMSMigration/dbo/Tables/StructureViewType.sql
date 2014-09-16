CREATE TABLE [dbo].[StructureViewType] (
    [ViewTypeID]   INT           IDENTITY (1, 1) NOT NULL,
    [ViewTypeName] NVARCHAR (50) NULL,
    CONSTRAINT [PK_StructureViewType] PRIMARY KEY CLUSTERED ([ViewTypeID] ASC)
);

