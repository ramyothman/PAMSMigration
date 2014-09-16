--End PartialOrder
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewPartialOrderID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewPartialOrderID int
	set @NewPartialOrderID=0
	if @EgyptID <>0
	begin
	select @NewPartialOrderID =  PartialOrderID from PartialOrder
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewPartialOrderID =  PartialOrderID from PartialOrder
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewPartialOrderID =  PartialOrderID from PartialOrder
	where QatarID=@QatarID
	end
	end
	return @NewPartialOrderID
END
