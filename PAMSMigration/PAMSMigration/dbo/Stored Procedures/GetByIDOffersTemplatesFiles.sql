-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDOffersTemplatesFiles]
	      @ID int
           AS
BEGIN
SELECT [ID]
      ,[OfferTemplateClarificationID]
      ,[ResponseID]
      ,[AttachedFile]
      ,[AttachedFileName]
      ,[Comment]
      ,[UserName]
      ,[ModifiedDate]
  FROM [dbo].[OffersTemplatesFiles]
  WHERE ID = @ID
END
