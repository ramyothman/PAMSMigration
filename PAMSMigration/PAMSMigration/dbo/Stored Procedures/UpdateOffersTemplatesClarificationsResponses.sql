-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOffersTemplatesClarificationsResponses]
	       @OfferTemplateClarificationID int
           ,@ResponseText ntext
           ,@ResponseOfferTemplateID int
           ,@ResponseBy nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@oldID int
           AS
BEGIN
	UPDATE [dbo].[OffersTemplatesClarificationsResponses]
   SET [OfferTemplateClarificationID] = @OfferTemplateClarificationID
      ,[ResponseText] = @ResponseText
      ,[ResponseOfferTemplateID] = @ResponseOfferTemplateID
      ,[ResponseBy] = @ResponseBy
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @oldID
END
