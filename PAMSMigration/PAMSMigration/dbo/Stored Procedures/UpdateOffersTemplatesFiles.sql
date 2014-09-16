-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOffersTemplatesFiles]
	       @OfferTemplateClarificationID int
           ,@ResponseID int
           ,@AttachedFile image
           ,@AttachedFileName nvarchar(100)
           ,@Comment nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@oldID int 
           AS
BEGIN
UPDATE [dbo].[OffersTemplatesFiles]
   SET [OfferTemplateClarificationID] = @OfferTemplateClarificationID
      ,[ResponseID] = @ResponseID
      ,[AttachedFile] = @AttachedFile
      ,[AttachedFileName] = @AttachedFileName
      ,[Comment] = @Comment
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @oldID
END
