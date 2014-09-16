CREATE TABLE [Serial].[SerialStatus] (
    [SerialStatusID] INT           IDENTITY (1, 1) NOT NULL,
    [BranchID]       INT           NULL,
    [SerialTypeID]   INT           NULL,
    [IsActive]       BIT           NULL,
    [SerialDate]     DATETIME      NULL,
    [UserName]       NVARCHAR (50) NULL,
    CONSTRAINT [PK_SerialStatus] PRIMARY KEY CLUSTERED ([SerialStatusID] ASC),
    CONSTRAINT [FK_SerialStatus_SerialType] FOREIGN KEY ([SerialTypeID]) REFERENCES [Serial].[SerialType] ([SerialTypeID]) ON DELETE CASCADE ON UPDATE CASCADE
);

