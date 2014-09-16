CREATE TABLE [dbo].[PartialDeliveryStatus] (
    [PartialDeliveryStatusID] INT           NOT NULL,
    [PartialDeliveryStatus]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_PartialDeliveryStatus] PRIMARY KEY CLUSTERED ([PartialDeliveryStatusID] ASC)
);

