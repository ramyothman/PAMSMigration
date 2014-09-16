CREATE TABLE [dbo].[IDS] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [InquiryNumber] NVARCHAR (50) NOT NULL,
    [OrderNumber]   NVARCHAR (50) NULL,
    [TransactionID] NVARCHAR (50) NULL,
    CONSTRAINT [PK_IDS] PRIMARY KEY CLUSTERED ([ID] ASC)
);

