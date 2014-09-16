-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewDocumentsJobsVersions]
	@ID INT OUT
   ,@DocID int
   ,@DocumentData varbinary(max)
   ,@FileName NVARCHAR(50)
   ,@VersionNo INT
   ,@UserName nvarchar(50)
   ,@ModifiedDate datetime
AS
BEGIN
	INSERT INTO [dbo].[DocumentsJobsVersions]
           ([DocID]
           ,[DocumentData]
           ,[FileName]
           ,[VersionNo]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@DocID
           ,@DocumentData
           ,@FileName
           ,@VersionNo
           ,@UserName
           ,@ModifiedDate)
IF(@@ROWCOUNT >0)
 SET @ID = SCOPE_IDENTITY();
 
END
