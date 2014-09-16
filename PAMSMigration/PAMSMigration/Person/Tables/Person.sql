CREATE TABLE [Person].[Person] (
    [BusinessEntityId] INT              NOT NULL,
    [NameStyle]        BIT              NULL,
    [EmailPromotion]   INT              NULL,
    [RowGuid]          UNIQUEIDENTIFIER CONSTRAINT [DF_Person_RowGuid] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME         CONSTRAINT [DF_Person_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreatedDate]      DATETIME         CONSTRAINT [DF_Person_CreatedDate] DEFAULT (getdate()) NULL,
    [PersonImage]      NVARCHAR (250)   NULL,
    [IsActive]         BIT              NULL,
    CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED ([BusinessEntityId] ASC)
);

