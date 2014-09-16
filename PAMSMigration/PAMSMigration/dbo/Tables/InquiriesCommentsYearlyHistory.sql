CREATE TABLE [dbo].[InquiriesCommentsYearlyHistory] (
    [ID]            INT            NOT NULL,
    [InquiryNumber] NVARCHAR (100) NULL,
    [Comment]       NTEXT          NULL,
    [UserName]      NVARCHAR (100) NULL,
    [ModifiedDate]  DATETIME       NULL,
    [ProjectTypeID] INT            NULL
);

