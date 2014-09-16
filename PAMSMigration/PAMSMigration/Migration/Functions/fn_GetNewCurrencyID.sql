
CREATE FUNCTION [Migration].[fn_GetNewCurrencyID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewCurrencyID int
	set @NewCurrencyID=NULL
	if @EgyptID <>0
	begin
	select @NewCurrencyID =  ID from dbo.Currencies
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewCurrencyID =  ID from dbo.Currencies
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewCurrencyID =  ID from dbo.Currencies
	where QatarID=@QatarID
	end
	end
	return @NewCurrencyID
END
