CREATE TABLE [dbo].[ProjectRegisteredSuppliers] (
    [ProjectRegisteredSupplierID] INT   IDENTITY (1, 1) NOT NULL,
    [ProjectID]                   INT   NULL,
    [SupplierID]                  INT   NULL,
    [Comment]                     NTEXT NULL,
    CONSTRAINT [PK_ProjectRegisteredSuppliers] PRIMARY KEY CLUSTERED ([ProjectRegisteredSupplierID] ASC),
    CONSTRAINT [FK_ProjectRegisteredSuppliers_Projects] FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[Projects] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_ProjectRegisteredSuppliers_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [dbo].[Suppliers] ([SupplierID]) ON DELETE CASCADE ON UPDATE CASCADE
);

