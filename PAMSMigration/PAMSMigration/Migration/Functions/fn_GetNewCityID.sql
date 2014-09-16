
--End [Person].[BusinessEntityContact]
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewCityID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewCityID int
	set @NewCityID=0
	if @EgyptID <>0
	begin
	select @NewCityID =  ID from dbo.Cities
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewCityID =  ID from dbo.Cities
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewCityID =  ID from dbo.Cities
	where QatarID=@QatarID
	end
	end
	return @NewCityID
END
