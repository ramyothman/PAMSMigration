-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetBacklogForSpecificPeriod]
(
    @PriceInEuro decimal(18,4),
	@SupplierID int,
	@ToDate datetime,
	@ProductType int,
	@BranchID int
)
RETURNS decimal(18,2)
AS
BEGIN
Declare @Result Decimal(18,2)
Declare @ShipmentAmount decimal(18,2)
SELECT @ShipmentAmount = Sum([PriceInEuro])      
  FROM [dbo].[PartialShipment]
where ShipmentDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))
      and InquiryNumber IN 
      ( select inquiries.InquiryNumber 
      from inquiries , orders
      where  BranchID = @BranchID and inquiries.InquiryNumber = orders.InquiryNumber and
             SupplierID = @SupplierID and ProductTypeID = @ProductType and
             OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))
			 and ((DeliveredON > @ToDate or DeliveredON is null)
			 OR ([Delivered] = 0 or [Delivered] is null)))
      	
if (@ShipmentAmount is null)
set @ShipmentAmount = 0
set @Result = @PriceInEuro - @ShipmentAmount
Return @Result
--Return @ShipmentAmount
END
