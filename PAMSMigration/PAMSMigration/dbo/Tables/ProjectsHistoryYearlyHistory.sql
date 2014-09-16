CREATE TABLE [dbo].[ProjectsHistoryYearlyHistory] (
    [ID]            INT             NOT NULL,
    [InquiryNumber] NVARCHAR (50)   NULL,
    [ProjectTypeID] INT             NULL,
    [ModifiedDate]  DATETIME        NULL,
    [UserName]      NVARCHAR (50)   NULL,
    [Percentage]    DECIMAL (18, 4) NULL,
    CONSTRAINT [PK_ProjectsHistoryYearlyHistory] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProjectsHistoryYearlyHistory_InquiriesYearlyHistory] FOREIGN KEY ([InquiryNumber]) REFERENCES [dbo].[InquiriesYearlyHistory] ([InquiryNumber]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_ProjectsHistoryYearlyHistory_ProjectTypes] FOREIGN KEY ([ProjectTypeID]) REFERENCES [dbo].[ProjectTypes] ([ID])
);

