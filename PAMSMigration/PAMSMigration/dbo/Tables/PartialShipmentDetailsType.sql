CREATE TABLE [dbo].[PartialShipmentDetailsType] (
    [PartialShipmentDetailsTypeID] INT           IDENTITY (1, 1) NOT NULL,
    [PartialShipmentDetailsType]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_PartialShipmentDetailsType] PRIMARY KEY CLUSTERED ([PartialShipmentDetailsTypeID] ASC)
);

