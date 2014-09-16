CREATE TABLE [Serial].[SerialComponent] (
    [SerialComponentID] INT           IDENTITY (1, 1) NOT NULL,
    [Description]       NVARCHAR (50) NULL,
    CONSTRAINT [PK_SerialComponent] PRIMARY KEY CLUSTERED ([SerialComponentID] ASC)
);

