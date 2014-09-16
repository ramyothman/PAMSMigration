CREATE TABLE [dbo].[RoleSuppliers] (
    [RoleSupplierId] INT IDENTITY (1, 1) NOT NULL,
    [RoleId]         INT NULL,
    [SupplierId]     INT NULL,
    CONSTRAINT [PK_RoleSuppliers] PRIMARY KEY CLUSTERED ([RoleSupplierId] ASC),
    CONSTRAINT [FK_RoleSuppliers_Roles] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_RoleSuppliers_Suppliers] FOREIGN KEY ([SupplierId]) REFERENCES [dbo].[Suppliers] ([SupplierID]) ON DELETE CASCADE ON UPDATE CASCADE
);

