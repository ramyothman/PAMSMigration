CREATE TABLE [dbo].[TimeSheetDetails] (
    [SheetDetailsID] INT             IDENTITY (1, 1) NOT NULL,
    [InquiryNumber]  NVARCHAR (50)   NULL,
    [Minutes]        INT             NULL,
    [TimePercentage] DECIMAL (5, 2)  NULL,
    [Cost]           DECIMAL (18, 2) NULL,
    [SupplierID]     INT             NULL,
    [SheetID]        INT             NULL,
    CONSTRAINT [PK_TimeSheetDetails] PRIMARY KEY CLUSTERED ([SheetDetailsID] ASC),
    CONSTRAINT [FK_TimeSheetDetails_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [dbo].[Suppliers] ([SupplierID]),
    CONSTRAINT [FK_TimeSheetDetails_TimeSheet] FOREIGN KEY ([SheetID]) REFERENCES [dbo].[TimeSheet] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
);

