-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateGuaranteeTypes]
           @GuaranteeType nvarchar(50)
           ,@SourceID int
           ,@DistinationID int
           ,@oldID int 
AS
BEGIN
UPDATE [dbo].[GuaranteeTypes]
   SET [GuaranteeType] = @GuaranteeType
      ,[SourceID] = @SourceID
      ,[DistinationID] = @DistinationID
 WHERE [ID] = @oldID
END
