CREATE PROCEDURE [dbo].[GetFullSuppliersWorkLoadOrderAll]
	-- Add the parameters for the stored procedure here
	@SupplierId as int = null,
	@BranchID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@SupplierId is null OR @SupplierId = 0)
	begin
		Select * From ViewFullSuppliersWorkLoadOrderAll where BranchID = @BranchID
	end
	else
	begin
		Select * From ViewFullSuppliersWorkLoadOrderAll Where SupplierId = @SupplierId and BranchID = @BranchID
	end
	-- Insert statements for procedure here
	
END
