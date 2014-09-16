CREATE TABLE [dbo].[PrincipalProjectsComments] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [CommentedByID] INT            NULL,
    [InquiryNumber] NVARCHAR (50)  NULL,
    [Comment]       NVARCHAR (MAX) NULL,
    [UserName]      NVARCHAR (50)  NULL,
    [ModifiedDate]  DATETIME       NULL,
    CONSTRAINT [PK_PrincipalProjectsComments] PRIMARY KEY CLUSTERED ([ID] ASC)
);

