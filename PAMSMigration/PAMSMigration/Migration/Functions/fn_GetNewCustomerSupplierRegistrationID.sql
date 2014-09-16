--Functions
Create FUNCTION [Migration].[fn_GetNewCustomerSupplierRegistrationID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewCustomerSupplierRegistrationIDID int
	set @NewCustomerSupplierRegistrationIDID=null
	if @EgyptID <>0
	begin
	select @NewCustomerSupplierRegistrationIDID =  ID from CustomerSupplierRegistration
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewCustomerSupplierRegistrationIDID =  ID from CustomerSupplierRegistration
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewCustomerSupplierRegistrationIDID =  ID from CustomerSupplierRegistration
	where QatarID=@QatarID
	end
	end
	return @NewCustomerSupplierRegistrationIDID
END
