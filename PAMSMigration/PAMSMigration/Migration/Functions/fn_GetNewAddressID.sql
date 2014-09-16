--End Person.Address
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewAddressID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewAddressID int
	set @NewAddressID=0
	if @EgyptID <>0
	begin
	select @NewAddressID =  AddressId from person.[Address]
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewAddressID =  AddressId from person.[Address]
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewAddressID =  AddressId from person.[Address]
	where QatarID=@QatarID
	end
	end
	return @NewAddressID
END
