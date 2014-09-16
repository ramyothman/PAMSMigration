CREATE TABLE [dbo].[CustomerSupplierRegistrationComments] (
    [ID]                             INT            IDENTITY (1, 1) NOT NULL,
    [CustomerSupplierRegistrationID] INT            NULL,
    [Comment]                        NVARCHAR (MAX) NULL,
    [UserName]                       NVARCHAR (50)  NULL,
    [ModifiedDate]                   DATETIME       NULL,
    CONSTRAINT [PK_CustomerSupplierRegistrationComments] PRIMARY KEY CLUSTERED ([ID] ASC)
);

