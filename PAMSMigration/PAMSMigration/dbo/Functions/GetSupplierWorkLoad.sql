-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	used in supplier work load control in dashboard
-- =============================================
CREATE FUNCTION [dbo].[GetSupplierWorkLoad]
(
	-- Add the parameters for the function here
	@SupplierID int,
	@InquiryStatus nvarchar(50),
	@IsCount bit,
	@InquiryTypeID int,
	@BranchID int
)
RETURNS decimal(18,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result decimal(18,2)
if(@InquiryStatus ='INQUIRY')
begin
    if(@IsCount ='True')
		SELECT @Result = count(InquiryNumber) 
		FROM         inquiries
		WHERE     ProjectTypeID = 1 and SupplierID = @SupplierID and BranchID = @BranchID
		--Group by InquiryStatus,SupplierID
    else
	-- Add the T-SQL statements to compute the return value here
		SELECT @Result = ISNULL(SUM(CAST(QuotationPriceInEuro AS decimal(26, 10))),0)
		FROM         inquiries
		WHERE      ProjectTypeID = 1 and SupplierID = @SupplierID and BranchID = @BranchID
		--Group by InquiryStatus,SupplierID
end
else if(@InquiryStatus ='Offer')
begin
    if(@IsCount ='True')    
		SELECT @Result = count(InquiryNumber) 
		FROM         inquiries
		WHERE     ProjectTypeID = 2 and SupplierID = @SupplierID and BranchID = @BranchID
		      and InquiryTypeID = @InquiryTypeID
		--Group by InquiryStatus,SupplierID
    else
	-- Add the T-SQL statements to compute the return value here
		SELECT @Result = ISNULL(SUM(CAST(QuotationPriceInEuro AS decimal(26, 10))),0)
		FROM         inquiries
		WHERE     ProjectTypeID = 2 and SupplierID = @SupplierID and BranchID = @BranchID
		      and InquiryTypeID = @InquiryTypeID
		--Group by InquiryStatus,SupplierID
end
else if(@InquiryStatus ='Order')
begin
    if(@IsCount ='True')    
		SELECT @Result = count(InquiryNumber) 
		FROM         inquiries
		WHERE     ProjectTypeID = 3 and SupplierID = @SupplierID and BranchID = @BranchID	  
		--Group by InquiryStatus,SupplierID
    else
	-- Add the T-SQL statements to compute the return value here
		SELECT  @Result = ISNULL(SUM(CAST(PriceInEuro AS decimal(26, 10))),0)
        FROM         inquiries, Orders
		WHERE     ProjectTypeID = 3  and SupplierID = @SupplierID and BranchID = @BranchID
		      and dbo.Orders.InquiryNumber =  inquiries.InquiryNumber
		--Group by InquiryStatus,SupplierID
end
	-- Return the result of the function
	RETURN @Result
END
