CREATE TABLE [dbo].[TimeSheet] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [PersonID]     INT           NULL,
    [SheetDate]    DATETIME      NULL,
    [UserName]     NVARCHAR (50) NULL,
    [ModifiedDate] DATETIME      NULL,
    [BranchID]     INT           NULL,
    [EgyptID]      INT           NULL,
    [RPEID]        INT           NULL,
    [QatarID]      INT           NULL,
    CONSTRAINT [PK_TimeSheet] PRIMARY KEY CLUSTERED ([ID] ASC)
);

