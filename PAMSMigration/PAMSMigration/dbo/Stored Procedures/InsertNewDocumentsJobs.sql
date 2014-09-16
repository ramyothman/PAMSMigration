-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewDocumentsJobs]
	@ID INT OUT
   ,@InquiryNumber nvarchar(50)
   ,@DocName nvarchar(150)
   ,@DocTypeID int
AS
BEGIN
	INSERT INTO [dbo].[DocumentsJobs]
           ([InquiryNumber]
           ,[DocName]
           ,[DocTypeID]
           )
     VALUES
           (@InquiryNumber
           ,@DocName
           ,@DocTypeID
           )
IF(@@ROWCOUNT >0)
 SET @ID = SCOPE_IDENTITY();
 
END
