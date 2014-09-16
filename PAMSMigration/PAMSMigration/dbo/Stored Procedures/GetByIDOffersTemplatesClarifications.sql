-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDOffersTemplatesClarifications]
	      @ID int
           AS
BEGIN
SELECT [ID]
      ,[OfferTemplateID]
      ,[TypeOfSubmissionID]
      ,[SubmissionFrom]
      ,[SubmittedPersone]
      ,[ClarificationText]
      ,[ClarificationDate]
      ,[IsResponse]
      ,[OfferTemplateClarificationID]
      ,[UserName]
      ,[ModifiedDate]
  FROM [dbo].[OffersTemplatesClarifications]
  WHERE ID = @ID
END
