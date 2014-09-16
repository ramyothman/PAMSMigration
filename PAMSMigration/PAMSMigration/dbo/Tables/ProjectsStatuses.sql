CREATE TABLE [dbo].[ProjectsStatuses] (
    [ID]            INT           NOT NULL,
    [ProjectStatus] NVARCHAR (50) NULL,
    [UserName]      NVARCHAR (50) NULL,
    [ModifiedDate]  DATETIME      NULL,
    CONSTRAINT [PK_ProjectsStatuses] PRIMARY KEY CLUSTERED ([ID] ASC)
);

