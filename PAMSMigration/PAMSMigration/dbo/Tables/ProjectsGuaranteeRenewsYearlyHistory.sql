CREATE TABLE [dbo].[ProjectsGuaranteeRenewsYearlyHistory] (
    [ID]           INT           NOT NULL,
    [GuaranteeID]  INT           NULL,
    [RenewDate]    DATETIME      NULL,
    [UserName]     NVARCHAR (50) NULL,
    [ModifiedDate] DATETIME      NULL,
    CONSTRAINT [PK_ProjectsGuaranteeRenewsYearlyHistory] PRIMARY KEY CLUSTERED ([ID] ASC)
);

