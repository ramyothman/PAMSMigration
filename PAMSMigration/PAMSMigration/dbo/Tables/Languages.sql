CREATE TABLE [dbo].[Languages] (
    [ID]       INT           IDENTITY (1, 1) NOT NULL,
    [Language] NVARCHAR (50) NULL,
    CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED ([ID] ASC)
);

