CREATE TABLE [dbo].[SecurityActivation] (
    [SecurityActivationId] INT           IDENTITY (1, 1) NOT NULL,
    [ProcessorId]          NVARCHAR (50) NULL,
    [ActivationCode]       NVARCHAR (50) NULL,
    [IsActivated]          BIT           NULL,
    [Inside]               BIT           NULL,
    [Outside]              BIT           NULL,
    [EndDate]              DATETIME      NULL,
    CONSTRAINT [PK_SecurityActivation] PRIMARY KEY CLUSTERED ([SecurityActivationId] ASC)
);

