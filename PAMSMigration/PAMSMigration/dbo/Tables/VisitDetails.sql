CREATE TABLE [dbo].[VisitDetails] (
    [VisitDetailsId]          INT           IDENTITY (1, 1) NOT NULL,
    [VisitId]                 INT           NULL,
    [SupplierId]              INT           NULL,
    [ReferencedShotecNumbers] NVARCHAR (50) NULL,
    [CustomerNotes]           NTEXT         NULL,
    [EngineerNotes]           NTEXT         NULL,
    [Satisfied]               NVARCHAR (50) NULL,
    [Reason]                  NTEXT         NULL,
    CONSTRAINT [PK_VisitDetails] PRIMARY KEY CLUSTERED ([VisitDetailsId] ASC),
    CONSTRAINT [FK_VisitDetails_Visits] FOREIGN KEY ([VisitId]) REFERENCES [dbo].[Visits] ([VisitId]) ON DELETE CASCADE ON UPDATE CASCADE
);

