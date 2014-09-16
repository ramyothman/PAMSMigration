CREATE VIEW [dbo].[GetAllSecurityActivation]
AS
SELECT     SecurityActivationId, ProcessorId, ActivationCode, IsActivated, Inside, Outside, EndDate
FROM         dbo.SecurityActivation
