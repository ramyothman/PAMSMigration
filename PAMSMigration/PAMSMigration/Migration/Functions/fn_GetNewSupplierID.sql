CREATE FUNCTION [Migration].[fn_GetNewSupplierID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewSupplierID int
	set @NewSupplierID=null
	if @EgyptID <>0
	begin
	select @NewSupplierID =  BusinessEntityId from Person.BusinessEntity
	where SupplierEgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewSupplierID = BusinessEntityId  from Person.BusinessEntity
	where SupplierRPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewSupplierID = BusinessEntityId  from Person.BusinessEntity
	where SupplierQatarID=@QatarID
	end
	end
	return @NewSupplierID
END
