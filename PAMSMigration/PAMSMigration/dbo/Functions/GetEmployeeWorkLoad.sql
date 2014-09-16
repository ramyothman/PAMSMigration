-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	used in employee workload control in dashboard
-- =============================================
CREATE FUNCTION [dbo].[GetEmployeeWorkLoad]
(
	-- Add the parameters for the function here
	@ResponsibleEngineerID int,
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
		WHERE     ProjectTypeID = 1 and ResponsibleEngineerID = @ResponsibleEngineerID and 
		         ( IsSubOffer ='False' or IsSubOffer is null) and BranchID = @BranchID
		--Group by InquiryStatus,ResponsibleEngineerID
    else
	-- Add the T-SQL statements to compute the return value here
		SELECT @Result = ISNULL(SUM(CAST(QuotationPriceInEuro AS decimal(26, 10))),0)
		FROM         inquiries
		WHERE      ProjectTypeID = 1 and ResponsibleEngineerID = @ResponsibleEngineerID and 
		         ( IsSubOffer ='False' or IsSubOffer is null) and BranchID = @BranchID
		--Group by InquiryStatus,ResponsibleEngineerID
end
else if(@InquiryStatus ='Offer')
begin
    if(@IsCount ='True')    
		SELECT @Result = count(InquiryNumber) 
		FROM         inquiries
		WHERE     ProjectTypeID = 2 and ResponsibleEngineerID = @ResponsibleEngineerID
		      and InquiryTypeID = @InquiryTypeID and BranchID = @BranchID and 
		         (IsSubOffer ='False' or IsSubOffer is null)
		--Group by InquiryStatus,ResponsibleEngineerID
    else
	-- Add the T-SQL statements to compute the return value here
		SELECT @Result = ISNULL(SUM(CAST(QuotationPriceInEuro AS decimal(26, 10))),0)
		FROM         inquiries
		WHERE     ProjectTypeID = 2 and ResponsibleEngineerID = @ResponsibleEngineerID
		      and InquiryTypeID = @InquiryTypeID and BranchID = @BranchID and 
		         ( IsSubOffer ='False' or IsSubOffer is null)
		--Group by InquiryStatus,ResponsibleEngineerID
end
else if(@InquiryStatus ='Order')
begin
    if(@IsCount ='True')    
		SELECT @Result = count(InquiryNumber) 
		FROM         inquiries
		WHERE     ProjectTypeID = 3 and ResponsibleEngineerID = @ResponsibleEngineerID	and 
		         ( IsSubOffer ='False' or IsSubOffer is null)and BranchID = @BranchID	  
		--Group by InquiryStatus,ResponsibleEngineerID
    else
	-- Add the T-SQL statements to compute the return value here
		SELECT  @Result = ISNULL(SUM(CAST(PriceInEuro AS decimal(26, 10))),0)
        FROM         inquiries, Orders
		WHERE     ProjectTypeID = 3  and ResponsibleEngineerID = @ResponsibleEngineerID
		      and dbo.Orders.InquiryNumber =  inquiries.InquiryNumber and BranchID = @BranchID and 
		         ( inquiries.IsSubOffer ='False' or inquiries.IsSubOffer is null)
		--Group by InquiryStatus,ResponsibleEngineerID
end
	-- Return the result of the function
	RETURN @Result
END
