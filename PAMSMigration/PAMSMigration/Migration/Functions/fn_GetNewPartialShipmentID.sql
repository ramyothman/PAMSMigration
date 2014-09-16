--End PartialShipment
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewPartialShipmentID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewPartialShipmentID int
	set @NewPartialShipmentID=0
	if @EgyptID <>0
	begin
	select @NewPartialShipmentID =  PartialShipmentID from PartialShipment
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewPartialShipmentID =  PartialShipmentID from PartialShipment
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewPartialShipmentID =  PartialShipmentID from PartialShipment
	where QatarID=@QatarID
	end
	end
	return @NewPartialShipmentID
END
