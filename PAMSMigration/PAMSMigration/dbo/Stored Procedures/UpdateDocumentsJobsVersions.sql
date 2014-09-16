-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDocumentsJobsVersions]
	@OldID INT 
   ,@DocID int
   ,@DocumentData varbinary(max)
   ,@FileName NVARCHAR(50)
   ,@VersionNo INT
   ,@UserName nvarchar(50)
   ,@ModifiedDate datetime
AS
BEGIN
UPDATE [dbo].[DocumentsJobsVersions]
   SET [DocID] = @DocID
      ,[DocumentData] = @DocumentData
      ,[FileName]=@FileName
      ,[VersionNo] = @VersionNo
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @OldID
 
END
