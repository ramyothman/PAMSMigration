-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewOffersTemplatesFiles]
	       @OfferTemplateClarificationID int
           ,@ResponseID int
           ,@AttachedFile image
           ,@AttachedFileName nvarchar(100)
           ,@Comment nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           AS
BEGIN
	INSERT INTO [dbo].[OffersTemplatesFiles]
           ([OfferTemplateClarificationID]
           ,[ResponseID]
           ,[AttachedFile]
           ,[AttachedFileName]
           ,[Comment]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@OfferTemplateClarificationID
           ,@ResponseID
           ,@AttachedFile
           ,@AttachedFileName
           ,@Comment
           ,@UserName
           ,@ModifiedDate)
           
 IF @@ROWCOUNT > 0
Select * from OffersTemplatesFiles
Where [ID] = @@identity
END
