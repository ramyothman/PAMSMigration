-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewOffersTemplatesClarifications]
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
           AS
BEGIN
	INSERT INTO [dbo].[OffersTemplatesClarifications]
           ([OfferTemplateID]
           ,[TypeOfSubmissionID]
           ,[SubmissionFrom]
           ,[SubmittedPersone]
           ,[ClarificationText]
           ,[ClarificationDate]
           ,[IsResponse]
           ,[OfferTemplateClarificationID]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@OfferTemplateID
           ,@TypeOfSubmissionID
           ,@SubmissionFrom
           ,@SubmittedPersone
           ,@ClarificationText
           ,@ClarificationDate
           ,@IsResponse
           ,@OfferTemplateClarificationID
           ,@UserName
           ,@ModifiedDate)
          
 IF @@ROWCOUNT > 0
Select * from OffersTemplatesClarifications
Where [ID] = @@identity
END
