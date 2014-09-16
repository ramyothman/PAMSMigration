CREATE TABLE [dbo].[CustomersPhones] (
    [CustomerPhoneID]   INT            IDENTITY (1, 1) NOT NULL,
    [CustomerID]        INT            NOT NULL,
    [PhoneNumber]       NVARCHAR (25)  NOT NULL,
    [PhoneNumberTypeId] INT            NOT NULL,
    [ModifiedDate]      DATETIME       CONSTRAINT [DF_CustomersPhones_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    [MainPhone]         BIT            NULL,
    [UserName]          NVARCHAR (50)  NULL,
    [ContactName]       NVARCHAR (250) NULL,
    CONSTRAINT [PK_CustomersPhones] PRIMARY KEY CLUSTERED ([CustomerPhoneID] ASC)
);

