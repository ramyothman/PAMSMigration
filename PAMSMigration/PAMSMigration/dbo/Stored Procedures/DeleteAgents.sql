CREATE PROCEDURE [dbo].[DeleteAgents]
    @AgentID int
AS
Begin
 Delete [dbo].[Agents] where     [AgentID] = @AgentID
End
