CREATE TABLE [dbo].[CustomerFields] (
    [CustomerFieldID]   INT           IDENTITY (1, 1) NOT NULL,
    [CustomerFieldName] NVARCHAR (50) NULL,
    CONSTRAINT [PK_CustomerFields] PRIMARY KEY CLUSTERED ([CustomerFieldID] ASC)
);

