CREATE PROCEDURE [dbo].[UpdateAgents]
    @OldAgentID int,
    @AgentName nvarchar(100),
    @AgentAddress nvarchar(300),
    @AgentWebSite nvarchar(100),
    @ContactTitle nvarchar(10),
    @ContactName nvarchar(100),
    @ContactDisplayName nvarchar(150),
    @ContactHomePhone nvarchar(50),
    @ContactWorkPhone nvarchar(50),
    @ContactMobile nvarchar(50),
    @ContactEmail nvarchar(50),
    @ContactAddress nvarchar(255),
    @ContactCountry nvarchar(50),
    @ContactCity nvarchar(50),
    @ContactZip nvarchar(50),
    @ContactFax nvarchar(50),
    @UserName nvarchar(50),
    @ModifiedDate datetime
AS
UPDATE [dbo].[Agents]
SET
    AgentName = @AgentName,
    AgentAddress = @AgentAddress,
    AgentWebSite = @AgentWebSite,
    ContactTitle = @ContactTitle,
    ContactName = @ContactName,
    ContactDisplayName = @ContactDisplayName,
    ContactHomePhone = @ContactHomePhone,
    ContactWorkPhone = @ContactWorkPhone,
    ContactMobile = @ContactMobile,
    ContactEmail = @ContactEmail,
    ContactAddress = @ContactAddress,
    ContactCountry = @ContactCountry,
    ContactCity = @ContactCity,
    ContactZip = @ContactZip,
    ContactFax = @ContactFax,
    UserName = @UserName,
    ModifiedDate = @ModifiedDate
WHERE [AgentID] = @OLDAgentID
IF @@ROWCOUNT > 0
Select * From Agents 
Where [AgentID] = @OLDAgentID
