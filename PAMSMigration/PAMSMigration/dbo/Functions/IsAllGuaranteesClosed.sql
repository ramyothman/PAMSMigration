-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[IsAllGuaranteesClosed]
(
@InquiryNumber nvarchar(50)
)
RETURNS bit
AS
BEGIN
	declare @Result bit
	declare @num int
	
	select @num = count(InquiryNumber) from [dbo].[ProjectsGuarantee] 
	where InquiryNumber = @InquiryNumber and IsActive = 'True'
	
	if(@num >0)
	  set @Result = 'False'
	else
	set @Result = 'True'
	
	return @Result
END
