CREATE TABLE [dbo].[ProjectsHistory] (
    [ID]            INT             IDENTITY (1, 1) NOT NULL,
    [InquiryNumber] NVARCHAR (50)   NULL,
    [ProjectTypeID] INT             NULL,
    [ModifiedDate]  DATETIME        NULL,
    [UserName]      NVARCHAR (50)   NULL,
    [Percentage]    DECIMAL (18, 4) NULL,
    [EgyptID]       INT             NULL,
    [RPEID]         INT             NULL,
    [QatarID]       INT             NULL,
    CONSTRAINT [PK_ProjectsHistory] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProjectsHistory_Inquiries] FOREIGN KEY ([InquiryNumber]) REFERENCES [dbo].[Inquiries] ([InquiryNumber]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_ProjectsHistory_ProjectTypes] FOREIGN KEY ([ProjectTypeID]) REFERENCES [dbo].[ProjectTypes] ([ID])
);

