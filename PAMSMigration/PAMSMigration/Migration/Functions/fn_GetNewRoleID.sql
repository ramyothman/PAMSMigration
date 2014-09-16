--Functions
CREATE FUNCTION [Migration].[fn_GetNewRoleID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewRoleID int
	set @NewRoleID=null
	if @EgyptID <>0
	begin
	select @NewRoleID =  ID from Roles
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewRoleID =  ID from Roles
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewRoleID =  ID from Roles
	where QatarID=@QatarID
	end
	end
	return @NewRoleID
END
