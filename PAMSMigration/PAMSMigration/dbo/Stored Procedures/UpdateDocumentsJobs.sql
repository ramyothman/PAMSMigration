-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDocumentsJobs]
	@OldID INT
   ,@InquiryNumber nvarchar(50)
   ,@DocName nvarchar(150)
   ,@DocTypeID int
   
AS
BEGIN
 UPDATE [dbo].[DocumentsJobs]
   SET [InquiryNumber] = @InquiryNumber
      ,[DocName] = @DocName
      ,[DocTypeID] = @DocTypeID
      
 WHERE ID = @OldID
END
