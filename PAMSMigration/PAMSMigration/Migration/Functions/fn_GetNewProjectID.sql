--End 
--------------------------------------------------------------------------------
--Funtions 
CREATE FUNCTION [Migration].[fn_GetNewProjectID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewProjectID int
	set @NewProjectID=0
	if @EgyptID <>0
	begin
	select @NewProjectID =  ID from dbo.Projects
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewProjectID =  ID from dbo.Projects
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewProjectID =  ID from dbo.Projects
	where QatarID=@QatarID
	end
	end
	return @NewProjectID
END
