/****** Object:  UserDefinedFunction [dbo].[GetNumberOfClientRunningProjects]    Script Date: 03/20/2013 12:55:44 ******/
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	used in supplier registration view to get the number of running projects for the client
-- =============================================
CREATE FUNCTION [dbo].[GetNumberOfClientRunningProjects] 
(
	-- Add the parameters for the function here
	@ClientID int,
	@BranchID int
)
RETURNS int
AS
BEGIN
	DECLARE @Count int
    declare @OwnerCount int
    declare @EngineerByCount int
    declare @ProcurementByCount int
    declare @ContractorCount int 
    
    select @OwnerCount = count(OwnerID) 
    from projects
    where OwnerID = @ClientID and ProjectStatusID = 1
    select  @EngineerByCount = count(EngineeringByID) 
    from projects
    where EngineeringByID = @ClientID and ProjectStatusID = 1 and (BranchID = @BranchID OR IsGeneral = 'True') and ID not in 
    (select ID from projects 
    where OwnerID = @ClientID and ProjectStatusID = 1)
    
    select @ProcurementByCount =  count(ProcurementByID) 
    from projects
    where ProcurementByID = @ClientID and ProjectStatusID = 1 and (BranchID = @BranchID OR IsGeneral = 'True') and ID not in
     (select ID from projects 
     where (OwnerID = @ClientID or EngineeringByID = @ClientID) and ProjectStatusID = 1)
    
    select @ContractorCount =  count(ContractorID)
    from projects
    where ContractorID = @ClientID and ProjectStatusID = 1 and (BranchID = @BranchID OR IsGeneral = 'True') and ID not in
     (select ID from projects 
     where (OwnerID = @ClientID or EngineeringByID = @ClientID or ProcurementByID = @ClientID) and ProjectStatusID = 1)
    
    set @Count = @OwnerCount + @EngineerByCount + @ProcurementByCount + @ContractorCount
    
	RETURN @Count
END
