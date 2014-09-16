CREATE FUNCTION [Migration].[fn_GetNewBankID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewBankID int
	set @NewBankID=null
	if @EgyptID <>0
	begin
	select @NewBankID =  ID from Banks
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewBankID =  ID from Banks
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewBankID =  ID from Banks
	where QatarID=@QatarID
	end
	end
	return @NewBankID
END
