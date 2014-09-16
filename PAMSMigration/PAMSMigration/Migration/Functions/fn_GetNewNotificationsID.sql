Create FUNCTION [Migration].[fn_GetNewNotificationsID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewNotificationID int
	set @NewNotificationID=null
	if @EgyptID <>0
	begin
	select @NewNotificationID =  ID from Notifications
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewNotificationID =  ID from Notifications
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewNotificationID =  ID from Notifications
	where QatarID=@QatarID
	end
	end
	return @NewNotificationID
END
