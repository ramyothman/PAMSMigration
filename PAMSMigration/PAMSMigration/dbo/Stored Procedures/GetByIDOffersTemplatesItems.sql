-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDOffersTemplatesItems]
	      @ID int
           AS
BEGIN
SELECT [ID]
      ,[OfferTemplateID]
      ,[ItemNumber]
      ,[Item]
      ,[Description]
      ,[Qty]
      ,[UnitPrice]
      ,[TotalPrice]
      ,[UserName]
      ,[ModifiedDate]
  FROM [dbo].[OffersTemplatesItems]
  WHERE ID = @ID
END
