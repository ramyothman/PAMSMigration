CREATE PROCEDURE [dbo].[GetByIDAgents]
    @AgentID int
AS
BEGIN
Select *
From [dbo].[Agents]
WHERE [AgentID] = @AgentID
END
