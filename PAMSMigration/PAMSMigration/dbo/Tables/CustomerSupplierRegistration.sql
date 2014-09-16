CREATE TABLE [dbo].[CustomerSupplierRegistration] (
    [ID]                   INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]           INT           NULL,
    [SupplierID]           INT           NULL,
    [RegistrationDate]     DATETIME      NULL,
    [IsRegistered]         BIT           NULL,
    [DeRegistrationDate]   DATETIME      NULL,
    [UserName]             NVARCHAR (50) NULL,
    [ModifiedDate]         DATETIME      NULL,
    [RegistrationStatusID] INT           NULL,
    [BranchID]             INT           NULL,
    [EgyptID]              INT           NULL,
    [RPEID]                INT           NULL,
    [QatarID]              INT           NULL,
    CONSTRAINT [PK_CustomerSupplierRegistration] PRIMARY KEY CLUSTERED ([ID] ASC)
);

