CREATE TABLE [dbo].[SystemPages] (
    [ID]       INT            IDENTITY (1, 1) NOT NULL,
    [ModCode]  NVARCHAR (50)  NULL,
    [PageName] NVARCHAR (50)  NULL,
    [Path]     NVARCHAR (200) NULL,
    [IsActive] BIT            NULL,
    [TabID]    INT            NULL,
    [EgyptID]  INT            NULL,
    [RPEID]    INT            NULL,
    [QatarID]  INT            NULL,
    CONSTRAINT [PK_SystemPages] PRIMARY KEY CLUSTERED ([ID] ASC)
);

