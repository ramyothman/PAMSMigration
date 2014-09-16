CREATE TABLE [Person].[Credential] (
    [BusinessEntityId] INT              NOT NULL,
    [Username]         NVARCHAR (60)    NOT NULL,
    [PasswordHash]     NVARCHAR (128)   NOT NULL,
    [PasswordSalt]     NVARCHAR (10)    NULL,
    [ActivationCode]   NVARCHAR (128)   NULL,
    [IsActivated]      BIT              NULL,
    [IsActive]         BIT              NOT NULL,
    [RowGuid]          UNIQUEIDENTIFIER CONSTRAINT [DF_Credential_RowGuid] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME         CONSTRAINT [DF_Credential_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED ([BusinessEntityId] ASC),
    CONSTRAINT [FK_Credential_Person] FOREIGN KEY ([BusinessEntityId]) REFERENCES [Person].[Person] ([BusinessEntityId])
);

