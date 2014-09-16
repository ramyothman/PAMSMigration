-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewOffersTemplatesClarificationsResponses]
	       @OfferTemplateClarificationID int
           ,@ResponseText ntext
           ,@ResponseOfferTemplateID int
           ,@ResponseBy nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           AS
BEGIN
	INSERT INTO [dbo].[OffersTemplatesClarificationsResponses]
           ([OfferTemplateClarificationID]
           ,[ResponseText]
           ,[ResponseOfferTemplateID]
           ,[ResponseBy]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@OfferTemplateClarificationID
           ,@ResponseText
           ,@ResponseOfferTemplateID
           ,@ResponseBy
           ,@UserName
           ,@ModifiedDate)
           
 IF @@ROWCOUNT > 0
Select * from OffersTemplatesClarificationsResponses
Where [ID] = @@identity
END
