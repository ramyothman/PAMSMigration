-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOffersTemplatesClarifications]
	       @OfferTemplateID int
           ,@TypeOfSubmissionID int
           ,@SubmissionFrom nvarchar(50)
           ,@SubmittedPersone nvarchar(50)
           ,@ClarificationText ntext
           ,@ClarificationDate datetime
           ,@IsResponse bit
           ,@OfferTemplateClarificationID int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@oldID int
           AS
BEGIN
	UPDATE [dbo].[OffersTemplatesClarifications]
   SET [OfferTemplateID] = @OfferTemplateID
      ,[TypeOfSubmissionID] = @TypeOfSubmissionID
      ,[SubmissionFrom] = @SubmissionFrom
      ,[SubmittedPersone] = @SubmittedPersone
      ,[ClarificationText] = @ClarificationText
      ,[ClarificationDate] = @ClarificationDate
      ,[IsResponse] = @IsResponse
      ,[OfferTemplateClarificationID] = @OfferTemplateClarificationID
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @oldID
END
