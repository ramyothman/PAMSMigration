CREATE TABLE [dbo].[CompletedProjects] (
    [InquiryNumber]        NVARCHAR (50) NOT NULL,
    [HasCommission]        BIT           NULL,
    [IsAllGuranteesClosed] BIT           NULL,
    [GuaranteesClosedDate] DATETIME      NULL,
    [IsAllCommissionPaid]  BIT           NULL,
    [AllCommssionPaidDate] DATETIME      NULL,
    [UserName]             NVARCHAR (50) NULL,
    [ModifiedDate]         DATETIME      NULL,
    CONSTRAINT [PK_CompletedProjects] PRIMARY KEY CLUSTERED ([InquiryNumber] ASC),
    CONSTRAINT [FK_CompletedProjects_Inquiries] FOREIGN KEY ([InquiryNumber]) REFERENCES [dbo].[Inquiries] ([InquiryNumber]) ON DELETE CASCADE ON UPDATE CASCADE
);

