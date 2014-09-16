CREATE TABLE [dbo].[VisitEngineers] (
    [ID]                    INT           IDENTITY (1, 1) NOT NULL,
    [VisitID]               INT           NULL,
    [ResponsibleEngineerID] INT           NULL,
    [UserName]              NVARCHAR (50) NULL,
    [ModifiedDate]          DATETIME      NULL,
    CONSTRAINT [PK_VisitEngineers] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_VisitEngineers_Visits] FOREIGN KEY ([VisitID]) REFERENCES [dbo].[Visits] ([VisitId])
);

