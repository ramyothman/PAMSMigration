-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetBacklog]
(
    @PriceInEuro decimal(18,4),
	@InquiryNumber nvarchar(50),
	@BranchID int
)
RETURNS decimal(18,2)
AS
BEGIN
Declare @Result Decimal(18,2)
Declare @ShipmentAmount decimal(18,2)
SELECT @ShipmentAmount = Sum([PriceInEuro]) 
FROM         PartialShipment INNER JOIN
                      Inquiries ON PartialShipment.InquiryNumber = Inquiries.InquiryNumber
where PartialShipment.[InquiryNumber] = @InquiryNumber and BranchID = @BranchID
if (@ShipmentAmount is null)
set @ShipmentAmount = 0
set @Result = @PriceInEuro - @ShipmentAmount
Return @Result
END
