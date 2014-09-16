-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePartialShipmentDetails]
            @PartialDeliveryID int
           ,@PartialShipmentID int 
           ,@PartialShipmentTypeID int  
           ,@PartialShipmentDescription nvarchar(MAX)
           ,@Quantity int      
           ,@PriceInEuro decimal(18,4)  
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@oldPartialShipmentDetailsID int  
AS
BEGIN
 
UPDATE [dbo].[PartialShipmentDetails]
   SET [PartialDeliveryID] = @PartialDeliveryID
      ,[PartialShipmentID] = @PartialShipmentID
      ,[PartialShipmentTypeID] = @PartialShipmentTypeID
      ,[PartialShipmentDescription] = @PartialShipmentDescription
      ,[Quantity] = @Quantity
      ,[PriceInEuro] = @PriceInEuro
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE [PartialShipmentDetailsID] = @oldPartialShipmentDetailsID
END
