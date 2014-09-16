CREATE TABLE [dbo].[InquiriesComments] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [InquiryNumber] NVARCHAR (50) NULL,
    [Comment]       NTEXT         NULL,
    [UserName]      NVARCHAR (50) NULL,
    [ModifiedDate]  DATETIME      NULL,
    [ProjectTypeID] INT           NULL,
    CONSTRAINT [PK_InquiriesComments] PRIMARY KEY CLUSTERED ([ID] ASC)
);

