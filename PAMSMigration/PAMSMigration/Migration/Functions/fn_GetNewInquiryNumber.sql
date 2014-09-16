--End Inquiries Comments
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewInquiryNumber]
(
	@EgyptID nvarchar(50) ,
	@RPEID nvarchar(50),
	@QatarID nvarchar(50)
)
RETURNS nvarchar(50)
AS
BEGIN
	declare @NewInquiryID nvarchar(50)
	set @NewInquiryID='0'
	if @EgyptID <>'0'
	begin
	select @NewInquiryID =  InquiryNumber from dbo.Inquiries
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>'0'
	begin
	select @NewInquiryID =  InquiryNumber from dbo.Inquiries
	where RPEID=@RPEID
	end
	
	else if @QatarID <>'0'
	begin
	select @NewInquiryID =  InquiryNumber from dbo.Inquiries
	where QatarID=@QatarID
	end
	end
	return @NewInquiryID
END
