CREATE TABLE [dbo].[CategoryBranches] (
    [CategoryBranchID] INT IDENTITY (1, 1) NOT NULL,
    [CategoryID]       INT NULL,
    [BranchID]         INT NULL,
    CONSTRAINT [PK_categoryBranches] PRIMARY KEY CLUSTERED ([CategoryBranchID] ASC),
    CONSTRAINT [FK_categoryBranches_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID]),
    CONSTRAINT [FK_categoryBranches_CompanyBranches] FOREIGN KEY ([BranchID]) REFERENCES [dbo].[CompanyBranches] ([ID])
);

