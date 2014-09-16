CREATE TABLE [dbo].[CustomersEmailAddress] (
    [CustomerEmailAddressID] INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]             INT           NULL,
    [EmailAddressTypeId]     INT           NULL,
    [Email]                  NVARCHAR (60) NULL,
    [ModifiedDate]           DATETIME      CONSTRAINT [DF_CustomersEmailAddress_ModifiedDate] DEFAULT (getdate()) NULL,
    [MainEmailAddress]       BIT           NULL,
    CONSTRAINT [PK_CustomersEmailAddress] PRIMARY KEY CLUSTERED ([CustomerEmailAddressID] ASC)
);

