-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewPartialShipmentDetails]
            @PartialDeliveryID int
           ,@PartialShipmentID int 
           ,@PartialShipmentTypeID int  
           ,@PartialShipmentDescription nvarchar(MAX)
           ,@Quantity int      
           ,@PriceInEuro decimal(18,4)  
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime          
AS
BEGIN
set @ModifiedDate = GETDATE()
	INSERT INTO [dbo].[PartialShipmentDetails]
           ([PartialDeliveryID]
           ,[PartialShipmentID]
           ,[PartialShipmentTypeID]
           ,[PartialShipmentDescription]
           ,[Quantity]
           ,[PriceInEuro]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@PartialDeliveryID
           ,@PartialShipmentID
           ,@PartialShipmentTypeID
           ,@PartialShipmentDescription
           ,@Quantity
           ,@PriceInEuro
           ,@UserName
           ,@ModifiedDate)
           
IF @@ROWCOUNT > 0
Select * from [PartialShipmentDetails]
Where PartialShipmentDetailsID = @@identity
END
