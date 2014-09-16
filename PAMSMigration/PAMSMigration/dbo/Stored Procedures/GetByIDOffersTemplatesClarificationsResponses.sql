-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDOffersTemplatesClarificationsResponses]
	      @ID int
           AS
BEGIN
SELECT [ID]
      ,[OfferTemplateClarificationID]
      ,[ResponseText]
      ,[ResponseOfferTemplateID]
      ,[ResponseBy]
      ,[UserName]
      ,[ModifiedDate]
  FROM [dbo].[OffersTemplatesClarificationsResponses]
  WHERE ID = @ID
END
