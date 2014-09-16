-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOffersTemplatesItems]
	        @OfferTemplateID int
           ,@ItemNumber nvarchar(250)
           ,@Item nvarchar(50)
           ,@Description nvarchar(MAX)
           ,@Qty int
           ,@UnitPrice decimal(18,4)
           ,@TotalPrice decimal(18,4)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@oldID int
           AS
BEGIN
	UPDATE [dbo].[OffersTemplatesItems]
   SET [OfferTemplateID] = @OfferTemplateID
      ,[ItemNumber] = @ItemNumber
      ,[Item] = @Item
      ,[Description] = @Description
      ,[Qty] = @Qty
      ,[UnitPrice] = @UnitPrice
      ,[TotalPrice] = @TotalPrice
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID =@oldID
END
