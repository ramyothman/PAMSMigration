CREATE TABLE [dbo].[ReportConfiguration] (
    [ID]                             INT            IDENTITY (1, 1) NOT NULL,
    [PrintCoverPage]                 BIT            NULL,
    [PrintCoverPageLogo]             BIT            NULL,
    [PrintCoverPageSlogen]           BIT            NULL,
    [PrintCoverPageCompanyStatement] BIT            NULL,
    [PrintFooterReportName]          BIT            NULL,
    [PrintFooterPageNumber]          BIT            NULL,
    [PrintFooterTodayDate]           BIT            NULL,
    [PrintDetailsLogo]               BIT            NULL,
    [PrintStartReportComment]        BIT            NULL,
    [PrintEndReportComment]          BIT            NULL,
    [ReportLeftMargin]               DECIMAL (5, 2) NULL,
    [ReportRightMargin]              DECIMAL (5, 2) NULL,
    [ReportTopMargin]                DECIMAL (5, 2) NULL,
    [ReportBottomMargin]             DECIMAL (5, 2) NULL,
    [UserName]                       NVARCHAR (50)  NULL,
    [ModifiedDate]                   DATETIME       NULL,
    [StartCommentTemplate]           NTEXT          NULL,
    [EndCommentTemplate]             NTEXT          NULL,
    [BranchID]                       INT            NULL,
    CONSTRAINT [PK_ReportCoonfiguration] PRIMARY KEY CLUSTERED ([ID] ASC)
);

