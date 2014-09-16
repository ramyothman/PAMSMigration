CREATE VIEW [dbo].[GetAllLostReasons]
AS
SELECT     ID, ReasonCode, ReasonName
FROM         dbo.LostReasons
