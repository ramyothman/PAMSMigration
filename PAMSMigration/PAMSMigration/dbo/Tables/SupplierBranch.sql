CREATE TABLE [dbo].[SupplierBranch] (
    [SupplierBranchID] INT IDENTITY (1, 1) NOT NULL,
    [SupplierID]       INT NULL,
    [BranchID]         INT NULL,
    CONSTRAINT [PK_SupplierBranch] PRIMARY KEY CLUSTERED ([SupplierBranchID] ASC),
    CONSTRAINT [FK_SupplierBranch_CompanyBranches] FOREIGN KEY ([BranchID]) REFERENCES [dbo].[CompanyBranches] ([ID]),
    CONSTRAINT [FK_SupplierBranch_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [dbo].[Suppliers] ([SupplierID]) ON DELETE CASCADE ON UPDATE CASCADE
);

