CREATE TABLE [dbo].[TwitterHashTags] (
    [ID]      INT           NOT NULL,
    [HashTag] NVARCHAR (50) NULL,
    CONSTRAINT [PK_TwitterHashTags] PRIMARY KEY CLUSTERED ([ID] ASC)
);

