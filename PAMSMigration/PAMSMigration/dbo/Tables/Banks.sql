CREATE TABLE [dbo].[Banks] (
    [ID]         INT           IDENTITY (1, 1) NOT NULL,
    [BankCode]   NVARCHAR (50) NOT NULL,
    [BankName]   NVARCHAR (50) NULL,
    [CurrencyID] INT           NULL,
    [SwiftCode]  NVARCHAR (50) NULL,
    [EgyptID]    INT           NULL,
    [RPEID]      INT           NULL,
    [QatarID]    INT           NULL,
    CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED ([ID] ASC)
);

