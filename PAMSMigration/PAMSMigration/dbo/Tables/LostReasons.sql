CREATE TABLE [dbo].[LostReasons] (
    [ID]         INT           IDENTITY (1, 1) NOT NULL,
    [ReasonCode] NVARCHAR (50) NOT NULL,
    [ReasonName] NVARCHAR (50) NULL,
    [EgyptID]    INT           NULL,
    [RPEID]      INT           NULL,
    [QatarID]    INT           NULL,
    CONSTRAINT [PK_LostReasons] PRIMARY KEY CLUSTERED ([ID] ASC)
);

