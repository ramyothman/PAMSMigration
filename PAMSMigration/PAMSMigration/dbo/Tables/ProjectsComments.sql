CREATE TABLE [dbo].[ProjectsComments] (
    [ProjectCommentID] INT            IDENTITY (1, 1) NOT NULL,
    [ProjectID]        INT            NULL,
    [Comment]          NVARCHAR (MAX) NULL,
    [UserName]         NVARCHAR (50)  NULL,
    [ModifiedDate]     DATETIME       NULL,
    [EgyptID]          INT            NULL,
    [RPEID]            INT            NULL,
    [QatarID]          INT            NULL,
    [ProjectStatusID]  INT            NULL,
    CONSTRAINT [PK_ProjectsComments] PRIMARY KEY CLUSTERED ([ProjectCommentID] ASC),
    CONSTRAINT [FK_ProjectsComments_Projects] FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[Projects] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
);

