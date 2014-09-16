--End ProjectsGuarantee
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewGuranteeID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewGuranteeID int
	set @NewGuranteeID=0
	if @EgyptID <>0
	begin
	select @NewGuranteeID =  ID from ProjectsGuarantee
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewGuranteeID =  ID from ProjectsGuarantee
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewGuranteeID =  ID from ProjectsGuarantee
	where QatarID=@QatarID
	end
	end
	return @NewGuranteeID
END
