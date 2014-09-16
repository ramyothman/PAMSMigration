-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetInquiryNumberByShotecNo]
(
	-- Add the parameters for the function here
	@ShotecNo nvarchar(50)
)
RETURNS nvarchar(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result nvarchar(50)
	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = InquiryNumber From Inquiries where ShotecNo = @ShotecNo
	-- Return the result of the function
	RETURN @Result
END
