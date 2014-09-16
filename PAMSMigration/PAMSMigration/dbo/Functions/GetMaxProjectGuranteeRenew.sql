-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetMaxProjectGuranteeRenew]
(
   @GuaranteeID int
)
RETURNS DateTime
AS
BEGIN
Declare @Result DateTime
select @Result = MAX(RenewDate) 
from ProjectsGuaranteeRenews
where GuaranteeID = @GuaranteeID
Return @Result
END
