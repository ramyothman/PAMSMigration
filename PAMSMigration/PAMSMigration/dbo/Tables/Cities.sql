CREATE TABLE [dbo].[Cities] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [CountryRegionCode] NCHAR (10)     NULL,
    [City]              NVARCHAR (250) NULL,
    [UserName]          NVARCHAR (50)  NULL,
    [ModifiedDate]      DATETIME       NULL,
    [EgyptID]           INT            NULL,
    [RPEID]             INT            NULL,
    [QatarID]           INT            NULL,
    CONSTRAINT [PK_Person]].[Cities] PRIMARY KEY CLUSTERED ([ID] ASC)
);

