-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewOffersTemplatesItems]
	        @OfferTemplateID int
           ,@ItemNumber nvarchar(250)
           ,@Item nvarchar(50)
           ,@Description nvarchar(MAX)
           ,@Qty int
           ,@UnitPrice decimal(18,4)
           ,@TotalPrice decimal(18,4)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           
           AS
BEGIN
	INSERT INTO [dbo].[OffersTemplatesItems]
           ([OfferTemplateID]
           ,[ItemNumber]
           ,[Item]
           ,[Description]
           ,[Qty]
           ,[UnitPrice]
           ,[TotalPrice]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@OfferTemplateID
           ,@ItemNumber
           ,@Item
           ,@Description
           ,@Qty
           ,@UnitPrice
           ,@TotalPrice
           ,@UserName
           ,@ModifiedDate)
           
IF @@ROWCOUNT > 0
Select *
from OffersTemplatesItems
Where [ID] = @@Identity
END
