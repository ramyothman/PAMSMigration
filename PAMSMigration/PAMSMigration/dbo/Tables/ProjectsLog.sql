CREATE TABLE [dbo].[ProjectsLog] (
    [ID]              INT             IDENTITY (1, 1) NOT NULL,
    [ProjectID]       INT             NULL,
    [SerializeObject] VARBINARY (MAX) NULL,
    [VersionNumber]   INT             NULL,
    [UserName]        NVARCHAR (50)   NULL,
    [ModifiedDate]    DATETIME        NULL,
    [EgyptID]         INT             NULL,
    [RPEID]           INT             NULL,
    [QatarID]         INT             NULL,
    CONSTRAINT [PK_ProjectsLog] PRIMARY KEY CLUSTERED ([ID] ASC)
);

