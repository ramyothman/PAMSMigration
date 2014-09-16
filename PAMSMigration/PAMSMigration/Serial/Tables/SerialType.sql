CREATE TABLE [Serial].[SerialType] (
    [SerialTypeID] INT           NOT NULL,
    [Description]  NVARCHAR (50) NULL,
    CONSTRAINT [PK_SerialType] PRIMARY KEY CLUSTERED ([SerialTypeID] ASC)
);

