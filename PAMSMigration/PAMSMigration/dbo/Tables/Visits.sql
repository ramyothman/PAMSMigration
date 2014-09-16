CREATE TABLE [dbo].[Visits] (
    [VisitId]        INT            IDENTITY (1, 1) NOT NULL,
    [VisitNo]        NVARCHAR (50)  NULL,
    [CustomerId]     INT            NULL,
    [Finalized]      BIT            NULL,
    [StartDateTime]  DATETIME       NULL,
    [EndDateTime]    DATETIME       NULL,
    [Accomplishment] NVARCHAR (255) NULL,
    [PendingTasks]   NVARCHAR (255) NULL,
    [VisitComments]  NTEXT          NULL,
    [Place]          NVARCHAR (150) NULL,
    [Reason]         NVARCHAR (50)  NULL,
    [VisitCopy]      IMAGE          NULL,
    [ReportDate]     DATETIME       NULL,
    [BranchID]       INT            NULL,
    [EgyptID]        INT            NULL,
    [RPEID]          INT            NULL,
    [QatarID]        INT            NULL,
    CONSTRAINT [PK_Visits] PRIMARY KEY CLUSTERED ([VisitId] ASC)
);

