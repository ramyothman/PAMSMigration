CREATE TABLE [dbo].[BankBranches] (
    [BankBranchID]      INT           IDENTITY (1, 1) NOT NULL,
    [BankID]            INT           NULL,
    [BranchID]          INT           NULL,
    [BankAccountNumber] NVARCHAR (50) NULL,
    CONSTRAINT [PK_BankBranches] PRIMARY KEY CLUSTERED ([BankBranchID] ASC),
    CONSTRAINT [FK_BankBranches_Banks] FOREIGN KEY ([BankID]) REFERENCES [dbo].[Banks] ([ID]),
    CONSTRAINT [FK_BankBranches_CompanyBranches] FOREIGN KEY ([BranchID]) REFERENCES [dbo].[CompanyBranches] ([ID])
);

