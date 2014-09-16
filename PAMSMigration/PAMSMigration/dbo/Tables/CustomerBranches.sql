CREATE TABLE [dbo].[CustomerBranches] (
    [CustomerBranchID] INT IDENTITY (1, 1) NOT NULL,
    [CustomerID]       INT NULL,
    [BranchID]         INT NULL,
    CONSTRAINT [PK_CustomerBranches] PRIMARY KEY CLUSTERED ([CustomerBranchID] ASC),
    CONSTRAINT [FK_CustomerBranches_CompanyBranches] FOREIGN KEY ([BranchID]) REFERENCES [dbo].[CompanyBranches] ([ID]),
    CONSTRAINT [FK_CustomerBranches_CustomerBranches] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID]) ON DELETE CASCADE ON UPDATE CASCADE
);

