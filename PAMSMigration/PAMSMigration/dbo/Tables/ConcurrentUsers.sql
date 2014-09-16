CREATE TABLE [dbo].[ConcurrentUsers] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [UserID]         INT           NULL,
    [IPAddress]      NVARCHAR (50) NULL,
    [LoginDate]      DATETIME      NULL,
    [IsIn]           BIT           NULL,
    [LogoutDate]     DATETIME      NULL,
    [IsSuspended]    BIT           NULL,
    [SuspensionDate] DATETIME      NULL,
    [PulseDate]      DATETIME      NULL,
    [UserName]       NVARCHAR (50) NULL,
    [ModifiedDate]   DATETIME      NULL,
    [BranchID]       INT           NULL,
    CONSTRAINT [PK_ConcurrentUsers] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ConcurrentUsers_Person] FOREIGN KEY ([UserID]) REFERENCES [Person].[Person] ([BusinessEntityId])
);

