CREATE TABLE [dbo].[GuaranteeTypes] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [GuaranteeType] NVARCHAR (50) NULL,
    [SourceID]      INT           NULL,
    [DistinationID] INT           NULL,
    CONSTRAINT [PK_GuranteeTypes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_GuranteeTypes_GuaranteeDistinations] FOREIGN KEY ([SourceID]) REFERENCES [dbo].[GuaranteeDistinations] ([ID]),
    CONSTRAINT [FK_GuranteeTypes_GuaranteeDistinations1] FOREIGN KEY ([SourceID]) REFERENCES [dbo].[GuaranteeDistinations] ([ID])
);

