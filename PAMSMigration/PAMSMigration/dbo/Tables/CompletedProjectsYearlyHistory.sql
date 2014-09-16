CREATE TABLE [dbo].[CompletedProjectsYearlyHistory] (
    [InquiryNumber]        NVARCHAR (50) NOT NULL,
    [HasCommission]        BIT           NULL,
    [IsAllGuranteesClosed] BIT           NULL,
    [GuaranteesClosedDate] DATETIME      NULL,
    [IsAllCommissionPaid]  BIT           NULL,
    [AllCommssionPaidDate] DATETIME      NULL,
    [UserName]             NVARCHAR (50) NULL,
    [ModifiedDate]         DATETIME      NULL,
    CONSTRAINT [PK_CompletedProjectsYearlyHistory] PRIMARY KEY CLUSTERED ([InquiryNumber] ASC),
    CONSTRAINT [FK_CompletedProjectsYearlyHistory_InquiriesYearlyHistory] FOREIGN KEY ([InquiryNumber]) REFERENCES [dbo].[InquiriesYearlyHistory] ([InquiryNumber]) ON DELETE CASCADE ON UPDATE CASCADE
);

