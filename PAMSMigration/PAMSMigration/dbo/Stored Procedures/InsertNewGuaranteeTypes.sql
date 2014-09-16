-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewGuaranteeTypes]
           @GuaranteeType nvarchar(50)
           ,@SourceID int
           ,@DistinationID int
AS
BEGIN
	INSERT INTO [dbo].[GuaranteeTypes]
           ([GuaranteeType]
           ,[SourceID]
           ,[DistinationID])
     VALUES
           (@GuaranteeType
           ,@SourceID
           ,@DistinationID)
           
 IF @@ROWCOUNT > 0
Select * from [GuaranteeTypes]
Where [ID] = @@identity
END
