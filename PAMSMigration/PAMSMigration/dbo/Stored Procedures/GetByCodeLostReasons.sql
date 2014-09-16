CREATE PROCEDURE [dbo].[GetByCodeLostReasons]
  @LostReasonCode nvarchar(50)
AS
BEGIN
Select *
From [dbo].[LostReasons]
WHERE ReasonCode = @LostReasonCode
END
