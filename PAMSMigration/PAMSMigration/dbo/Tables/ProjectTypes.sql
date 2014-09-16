CREATE TABLE [dbo].[ProjectTypes] (
    [ID]               INT           NOT NULL,
    [ProjectType]      NVARCHAR (50) NULL,
    [ProjectTypeColor] NVARCHAR (50) NULL,
    [OrderByType]      INT           NULL,
    CONSTRAINT [PK_ProjectTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

