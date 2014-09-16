CREATE TABLE [dbo].[DocumentsJobs] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [InquiryNumber] NVARCHAR (50)  NULL,
    [DocName]       NVARCHAR (150) NULL,
    [DocTypeID]     INT            NULL,
    [EgyptID]       INT            NULL,
    [RPEID]         INT            NULL,
    [QatarID]       INT            NULL,
    CONSTRAINT [PK_DocumentsJobs] PRIMARY KEY CLUSTERED ([ID] ASC)
);

