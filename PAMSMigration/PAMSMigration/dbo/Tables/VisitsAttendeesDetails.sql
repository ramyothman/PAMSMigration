CREATE TABLE [dbo].[VisitsAttendeesDetails] (
    [VisitAttendeesDetailsId] INT            IDENTITY (1, 1) NOT NULL,
    [VisitId]                 INT            NULL,
    [Attendees]               NVARCHAR (150) NULL,
    [Position]                NVARCHAR (150) NULL,
    CONSTRAINT [PK_VisitsAttendeesDetails] PRIMARY KEY CLUSTERED ([VisitAttendeesDetailsId] ASC),
    CONSTRAINT [FK_VisitsAttendeesDetails_Visits] FOREIGN KEY ([VisitId]) REFERENCES [dbo].[Visits] ([VisitId])
);

