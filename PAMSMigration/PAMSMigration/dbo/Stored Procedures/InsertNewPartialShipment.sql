-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewPartialShipment]
            @ShipmentNumber nvarchar(50)
           ,@InquiryNumber nvarchar(50)  
           ,@InvoiceNumber nvarchar(150)       
           ,@ShipmentDate datetime          
           ,@ItemDescription nvarchar(150)           
           ,@Price decimal(18,4)           
            ,@Invoicevalue decimal(18,4)
            ,@InvoicevalueInEuro decimal(18,4)
           ,@CurrencyID int
           ,@RateToEuro decimal(18,4)
           ,@RateDate datetime
           ,@PriceInEuro money
           ,@Remarks nvarchar(max)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime          
AS
BEGIN
 set @RateDate = @ShipmentDate
 set @ModifiedDate =GETDATE()
 
	INSERT INTO [dbo].[PartialShipment]
           ([ShipmentNumber]
           ,[InquiryNumber]
           ,[InvoiceNumber]
           ,[ShipmentDate]
           ,[ItemDescription]         
           ,[Price]
           , [Invoicevalue]  
           , [InvoicevalueInEuro] 
           ,[CurrencyID]
           ,[RateToEuro]
           ,[RateDate]
           ,[PriceInEuro]
           ,[Remarks]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@ShipmentNumber
           ,@InquiryNumber
           ,@InvoiceNumber
           ,@ShipmentDate
           ,@ItemDescription         
           ,@Price
           ,@Invoicevalue 
           ,@InvoicevalueInEuro 
           ,@CurrencyID
           ,@RateToEuro
           ,@RateDate
           ,@PriceInEuro
           ,@Remarks
           ,@UserName
           ,@ModifiedDate)
           
IF @@ROWCOUNT > 0
Select * from [PartialShipment]
Where PartialShipmentID = @@identity
END
