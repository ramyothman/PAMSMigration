CREATE TABLE [dbo].[InquiryTypes] (
    [InquiryType]        NVARCHAR (50)  NOT NULL,
    [InquiryDescription] NVARCHAR (100) NULL,
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_InquiryTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

