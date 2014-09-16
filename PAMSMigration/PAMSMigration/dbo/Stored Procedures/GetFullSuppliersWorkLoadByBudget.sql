CREATE PROCEDURE [dbo].[GetFullSuppliersWorkLoadByBudget]
	-- Add the parameters for the stored procedure here
	@SupplierId as int = null, 
	@InquiryType as nvarchar(50) = null,
	@BranchID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@SupplierId = 0)
		Set @SupplierId = null
	if(@InquiryType = '')
		Set @InquiryType = null
	if(@SupplierId is null AND @InquiryType is null)
	begin
		Select * From ViewFullSupplierWorkLoadByBudget where BranchID = @BranchID
	end
	else if(@SupplierId is null AND @InquiryType is not null)
	begin
		Select * From ViewFullSupplierWorkLoadByBudget Where InquiryType = @InquiryType and BranchID = @BranchID
	end
	else if (@SupplierId is not null AND @InquiryType is null)
	begin
		Select * From ViewFullSupplierWorkLoadByBudget Where SupplierId = @SupplierId and BranchID = @BranchID
	end
	else
	begin
		Select * From ViewFullSupplierWorkLoadByBudget where InquiryType = @InquiryType and SupplierId = @SupplierId and BranchID = @BranchID
	end
    -- Insert statements for procedure here
	
END
