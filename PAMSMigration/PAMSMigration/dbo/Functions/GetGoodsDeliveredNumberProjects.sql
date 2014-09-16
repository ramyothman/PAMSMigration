-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetGoodsDeliveredNumberProjects]
(
	@SupplierID int,
	@FromDate as datetime,
    @ToDate as datetime,
    @ProductTypeID int,
    @BranchID int
)
RETURNS int
AS
BEGIN
Declare @Result int
SELECT  @Result = Count('Delivered')						 
					FROM  viewSubProjectTotals
					where BranchID = @BranchID and DeliveredON is not null and 
					     DeliveredON >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
						  DeliveredON <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
						  SupplierID = @SupplierID and ProductTypeID = @ProductTypeID
				   Group by YEAR(DeliveredON),Month(DeliveredON),ProductTypeID
	if(@Result is null)
	set @Result = 0
Return @Result
END
