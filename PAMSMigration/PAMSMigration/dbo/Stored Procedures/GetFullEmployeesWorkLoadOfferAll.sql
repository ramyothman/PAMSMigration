CREATE PROCEDURE [dbo].[GetFullEmployeesWorkLoadOfferAll]
	-- Add the parameters for the stored procedure here
	@ResponsibleEngineerId as int = null, 
	@InquiryType as nvarchar(50) = null,
	@BranchID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@ResponsibleEngineerId is null AND @InquiryType is null)
	begin
		Select * From ViewFullEmployeeWorkLoadOfferAll where BranchID = @BranchID
	end
	else if(@ResponsibleEngineerId is null AND @InquiryType is not null)
	begin
		Select * From ViewFullEmployeeWorkLoadOfferAll Where InquiryType = @InquiryType and BranchID = @BranchID
	end
	else if (@ResponsibleEngineerId is not null AND @InquiryType is null)
	begin
		Select * From ViewFullEmployeeWorkLoadOfferAll Where ResponsibleEngineerId = @ResponsibleEngineerId and BranchID = @BranchID
	end
	else
	begin
		Select * From ViewFullEmployeeWorkLoadOfferAll where InquiryType = @InquiryType and ResponsibleEngineerId = @ResponsibleEngineerId and BranchID = @BranchID
	end
    -- Insert statements for procedure here
	
END
