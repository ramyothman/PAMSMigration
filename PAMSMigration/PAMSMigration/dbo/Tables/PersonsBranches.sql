CREATE TABLE [dbo].[PersonsBranches] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [PersonID]      INT           NULL,
    [BranchID]      INT           NULL,
    [DefaultBranch] BIT           NULL,
    [UserName]      NVARCHAR (50) NULL,
    [ModifiedDate]  DATETIME      NULL,
    CONSTRAINT [PK_PersonsBranches] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_PersonsBranches_CompanyBranches] FOREIGN KEY ([BranchID]) REFERENCES [dbo].[CompanyBranches] ([ID])
);

