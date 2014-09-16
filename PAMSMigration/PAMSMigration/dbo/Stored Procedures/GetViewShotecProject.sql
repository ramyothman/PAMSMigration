-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetViewShotecProject]
	-- Add the parameters for the stored procedure here
	
	@WhereQuery nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	Declare @Query nvarchar(max)
	Declare @InquiryOfferCol nvarchar(max)
	Declare @LostsCol nvarchar(max)
	Declare @OrdersCol nvarchar(max)
	Declare @CommCol nvarchar(max)
	Declare @InquiryOfferTables nvarchar(max)
	Declare @LostsTables nvarchar(max)
	Declare @OrdersTables nvarchar(max)
	Declare @CommTables nvarchar(max)
	Declare @QueryCols nvarchar(max)
	Declare @QueryTables nvarchar(max)
    
	Set @Query = 'select   '
	Set @InquiryOfferCol = 'dbo.Inquiries.InquiryNumber AS ProjectSerialNumber, dbo.Inquiries.ResponsibleEngineerID,
dbo.Inquiries.InquiryTypeID, dbo.Inquiries.CustomerID, dbo.Inquiries.CustomerInquiryNumber AS ClientInquiryNumber,
dbo.Inquiries.ProductID, dbo.Inquiries.InquiryDate, dbo.Inquiries.BidDueDate, dbo.Inquiries.SupplierID, 
dbo.Inquiries.SupplierQuotationNumber, dbo.Inquiries.QuotationPrice, dbo.Inquiries.CurrencyID AS QuotationCurrency, 
dbo.Inquiries.RateToEuro AS QuotationRateToEURO, dbo.Inquiries.ONDate AS QuotationRateDate, dbo.Inquiries.QuotationPriceInEuro, 
dbo.Inquiries.Comment AS ProjectComment, 
dbo.Inquiries.UserName, dbo.Inquiries.ModifiedDate, dbo.Inquiries.ProductDescription, dbo.Inquiries.ShotecNo, 
dbo.Inquiries.OnHold, dbo.Inquiries.InquiryStatusID, dbo.ProjectTypes.ProjectType AS ProjectStatus, 
dbo.Inquiries.ProjectTypeID, dbo.Inquiries.OfferDate, dbo.Inquiries.ParentInquiryNumber, 
dbo.Inquiries.IsSubOffer, dbo.Inquiries.ProductTypeID,dbo.ProductTypes.ProductType, dbo.Inquiries.OrderPercentage, dbo.Inquiries.LostPercentage, 
dbo.Inquiries.CancelledPercentage, dbo.Inquiries.LateResponsePercentage, dbo.Inquiries.OrderChanceID, 
dbo.OrdersChance.OrderChance, dbo.Inquiries.HasGuarantee AS InquiryHasGuarantee, dbo.Inquiries.ProjectID, dbo.Projects.ProjectCode, 
dbo.Projects.ProjectName,dbo.Projects.ProjectLocation,dbo.Projects.ProjectDescription, 
dbo.InquiryStatus.Name AS OfferStatus, dbo.InquiryTypes.InquiryType, 
dbo.Currencies.CurrencyCode AS QuotationCurrencyCode, dbo.Inquiries.BranchID, dbo.CompanyBranches.BranchNameFL, 
dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, 
dbo.Inquiries.PriceBaseID as InquiryPriceBaseID, dbo.Inquiries.PaymentBaseID as InquiryPaymentBaseID,
dbo.Customers.CompanyName AS ClientName,dbo.Customers.CompanyCode AS CompanyCode,dbo.Customers.CompanyWebSite AS ClientWebsite,ISNULL(dbo.Customers.CompanyCode, N'' '') AS ProjectOwnerName,
dbo.Suppliers.SupplierName,dbo.Suppliers.SupplierID,
Person.PersonLanguages.DisplayName AS ResponsibleEngineer,Person.PersonLanguages.LanguageId,
dbo.Category.Name AS CategoryName, Inquiries.FileNo  , 
CASE dbo.ProjectTypes.ProjectType WHEN ''Inquiry'' THEN ''Inquiry'' WHEN ''Offer'' THEN ''Offer'' WHEN ''Order'' THEN ''Order'' WHEN ''GoodsPaid'' THEN ''GoodsPaid'' WHEN ''Delivered'' THEN ''Delivered'' When ''Completed'' THEN ''Completed'' When ''Lost'' THEN ''Lost'' When ''Canceled'' THEN ''Cancelled'' When ''LateResponse'' THEN ''LateResponse'' When ''Regret'' THEN ''Regret''  END AS Ordering
'
	Set @QueryCols = @InquiryOfferCol
	
	Set @LostsCol = ', Losts.LostReasonID, Losts.WinnerName AS LostWinnerName, Losts.WinnerPrice AS LostWinnerPrice,
Losts.WinnerPriceInEuro AS LostWinnerPriceInEuro, Losts.RateToEuro AS LostWinnerRateToEuro, 
Losts.RateDate AS LostWinnerRateDate, Losts.WinnerPriceCurrencyID AS LostWinnerPriceCurrencyID,
Losts.ModifiedDate AS LostDate,Losts.IsSubLost, Losts.ParentInquiryNumber AS LostParentInquiryNumber,
Losts.LostComment
,LostReasons.ReasonName, LostReasons.ReasonCode as LostReasonCode,
LostCurrencies.CurrencyCode AS LostWinnerPriceCurrencyCode'
	Set @OrdersCol = ',ISNULL(dbo.Orders.OrderNumber,'''')  AS ShotecOrderNumber, dbo.Orders.CustomerOrderNumber, dbo.Orders.SupplierOrderNumber, dbo.Orders.DeliveryTime, dbo.Orders.DeliveredON, dbo.Orders.Delivered, 
dbo.Orders.ExpansionDeliveryDate AS ExpectedDeliveryDate, dbo.Orders.PaymentTypeID, dbo.Orders.PriceBaseID, dbo.Orders.Price AS OrderPrice, dbo.Orders.CurrencyID AS OrderCurrencyID, 
dbo.Orders.RateToEuro AS OrderRateToEuro, dbo.Orders.ONDate AS OrderRateDate, dbo.Orders.PriceInEuro AS OrderPriceInEuro, dbo.Orders.OrderDate, 
dbo.Orders.PriceCommissionBase AS OrderPriceCommissionBase, dbo.Orders.PercentPriceCommissionBase AS OrderPercentPriceCommissionBase, dbo.OrderStatus.Name AS OrderStatus, 
dbo.Orders.ParentOrderNumber, dbo.Orders.IsSubOrder, dbo.Orders.BackLog, dbo.Orders.CompletedGoodsPaidON, dbo.Orders.IsCompletedGoodsPaid, dbo.Orders.HasGuarantee AS OrderHasGuarantee, 
dbo.Orders.OrderStatusID, dbo.Currencies.CurrencyCode AS OrderCurrencyCode, dbo.PriceBase.PriceBaseCode, dbo.PaymentTypes.PaymentType
, isnull(dbo.ViewPaymentTotals.Outstanding,0) AS OutStandingPayment,dbo.Orders.DeliveryTimePeriodID,  dbo.TimePeriod.PeriodName AS OrderDeliveryTimePeriodName
                      
,dbo.CompletedProjects.HasCommission, dbo.CompletedProjects.IsAllGuranteesClosed, dbo.CompletedProjects.GuaranteesClosedDate, dbo.CompletedProjects.IsAllCommissionPaid, 
dbo.CompletedProjects.AllCommssionPaidDate   ' 
	Set @CommCol = ',dbo.Commissions.PercentPriceCommissionBase AS CommPercentPriceCommissionBase, dbo.Commissions.CommissionPercent, dbo.Commissions.CommissionAmount, 
dbo.Commissions.CurrencyID AS CommissionCurrencyID, dbo.Commissions.RateToEuro AS CommissionRateToEuro, dbo.Commissions.ONDate AS CommissionRateDate, 
dbo.Commissions.CommissionAmountInEuro, dbo.Banks.BankName, dbo.Commissions.Paid AS CommissionPaid, dbo.Commissions.MinPriceCommissionBase, 
dbo.Commissions.MinPercentPriceCommissionBase, dbo.Commissions.MinCommissionAmount, dbo.Commissions.MinPercentCommissionAmount
, CAST((CASE WHEN Commissions.InquiryNumber IS NULL THEN 0 ELSE 1 END) AS Bit) AS HasCommission
,dbo.Currencies.CurrencyCode AS CommissionCurrency, dbo.Commissions.BankID
,CAST(ISNULL(dbo.view_SubViewCommissionAmounts.PaidCommissionAmount, 0) AS decimal(18, 2)) AS PaidCommissionAmount
,CAST(ISNULL(dbo.view_SubViewCommissionAmounts.RemainingCommissionAmount, 0) AS decimal(18, 2)) AS RemainingCommissionAmount 
,dbo.ViewPaymentTotals.Paid 
                         * ISNULL(dbo.Orders.PercentPriceCommissionBase, 0) * ISNULL(dbo.Commissions.CommissionPercent, 0) 
                         - isnull(dbo.ViewPaidCommissionsTotals.PaidCommissionInEuro,0) AS DueCommission 
'
	if(CHARINDEX('ProjectSerialNumber',@WhereQuery) > 0)
	begin
		Set @QueryCols = @QueryCols + @LostsCol + @OrdersCol + @CommCol
	end
	else
	begin
	if (CHARINDEX('''Lost',@WhereQuery) > 0 OR CHARINDEX('Canceled',@WhereQuery) > 0 OR CHARINDEX('Cancelled',@WhereQuery) > 0 OR CHARINDEX('Regret',@WhereQuery) > 0 OR CHARINDEX('LateResponse',@WhereQuery) > 0 )
		Set @QueryCols = @QueryCols + @LostsCol
	if (CHARINDEX('''Order',@WhereQuery) > 0 OR CHARINDEX('Delivered',@WhereQuery) > 0 OR CHARINDEX('GoodsPaid',@WhereQuery) > 0 OR CHARINDEX('Completed',@WhereQuery) > 0 )
		Set @QueryCols = @QueryCols + @OrdersCol
	if (CHARINDEX('Commissions',@WhereQuery) > 0)
		Set @QueryCols = @QueryCols + @CommCol
	end
		
		Set @InquiryOfferTables = ' dbo.Inquiries Inner Join
dbo.ProjectTypes ON dbo.Inquiries.ProjectTypeID = dbo.ProjectTypes.ID INNER JOIN
dbo.Projects ON dbo.Inquiries.ProjectID = dbo.Projects.ID INNER JOIN
dbo.CompanyBranches  ON dbo.Inquiries.BranchID = dbo.CompanyBranches.ID INNER JOIN
dbo.ProductTypes ON dbo.Inquiries.ProductTypeID = dbo.ProductTypes.ProductTypeID Inner Join
dbo.CompanyCountries ON dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID  LEFT OUTER JOIN
dbo.InquiryTypes ON dbo.Inquiries.InquiryTypeID = dbo.InquiryTypes.ID LEFT OUTER JOIN
dbo.InquiryStatus ON dbo.Inquiries.InquiryStatusID = dbo.InquiryStatus.ID LEFT OUTER JOIN
dbo.Currencies ON dbo.Inquiries.CurrencyID = dbo.Currencies.ID LEFT OUTER JOIN
dbo.OrdersChance ON dbo.Inquiries.OrderChanceID = dbo.OrdersChance.ID Inner Join
dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID Inner Join
dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID Inner Join
Person.PersonLanguages ON dbo.Inquiries.ResponsibleEngineerID = Person.PersonLanguages.PersonId Left Join
dbo.Category ON dbo.Inquiries.ProductID = dbo.Category.CategoryID '
		Set @QueryTables = @InquiryOfferTables
	
	Set @LostsTables = ' Left JOIN
dbo.Losts ON dbo.Inquiries.InquiryNumber = dbo.Losts.InquiryNumber 
Left Join dbo.LostReasons ON dbo.Losts.LostReasonID = dbo.LostReasons.ID
Left Join dbo.Currencies as LostCurrencies ON dbo.Losts.WinnerPriceCurrencyID = LostCurrencies.ID
'
	Set @OrdersTables = ' Left Join 
dbo.Orders ON dbo.Orders.InquiryNumber = dbo.Inquiries.InquiryNumber
Left Join dbo.TimePeriod ON dbo.Orders.DeliveryTimePeriodID = dbo.TimePeriod.TimePeriodID 
Left Join dbo.PaymentTypes ON dbo.Orders.PaymentTypeID = dbo.PaymentTypes.ID
Left Join dbo.Currencies as OrderCurrencies on dbo.Orders.CurrencyID = OrderCurrencies.ID
Left Join dbo.PriceBase on dbo.Orders.PriceBaseID = dbo.PriceBase.ID
Left Join dbo.OrderStatus on dbo.Orders.OrderStatusID = dbo.OrderStatus.ID
Left Join dbo.ViewPaymentTotals ON dbo.Orders.InquiryNumber = dbo.ViewPaymentTotals.InquiryNumber
Left Join dbo.CompletedProjects ON dbo.Inquiries.InquiryNumber = dbo.CompletedProjects.InquiryNumber
 '
	Set @CommTables = 'Left Join dbo.Commissions ON dbo.Inquiries.InquiryNumber = dbo.Commissions.InquiryNumber
Left Join dbo.Currencies as CommissionCurrencies on dbo.Commissions.CurrencyID = CommissionCurrencies.ID
Left Join dbo.Banks on dbo.Commissions.BankID = dbo.Banks.ID
Left Join dbo.view_SubViewCommissionAmounts ON dbo.Commissions.InquiryNumber = dbo.view_SubViewCommissionAmounts.InquiryNumber
Left Join dbo.ViewPaidCommissionsTotals ON dbo.Commissions.InquiryNumber = dbo.ViewPaidCommissionsTotals.InquiryNumber  
'
if(CHARINDEX('ProjectSerialNumber',@WhereQuery) > 0)
	begin
		Set @QueryTables = @QueryTables + @LostsTables + @OrdersTables + @CommTables
	end
	else
	begin
		
		if (CHARINDEX('''Lost',@WhereQuery) > 0 OR CHARINDEX('Canceled',@WhereQuery) > 0 OR CHARINDEX('Cancelled',@WhereQuery) > 0OR CHARINDEX('Regret',@WhereQuery) > 0 OR CHARINDEX('LateResponse',@WhereQuery) > 0 )
			Set @QueryTables = @QueryTables + @LostsTables
		--else
		--begin
		----Set @WhereQuery = REPLACE(@WhereQuery,'and (IsSubLost =''false'' or IsSubLost is null)','') 
		----Set @WhereQuery = REPLACE(@WhereQuery,'and (IsSubLost =''true'' or IsSubLost is not null)','') 
		----Set @WhereQuery = REPLACE(@WhereQuery,'and (IsSubLost =''true'')','') 
		----Set @WhereQuery = REPLACE(@WhereQuery,'and (IsSubLost =''true'' )','') 
		----Set @WhereQuery = REPLACE(@WhereQuery,'and IsSubLost = ''true''','') 
		
		--end
	if (CHARINDEX('''Order',@WhereQuery) > 0 OR CHARINDEX('Delivered',@WhereQuery) > 0 OR CHARINDEX('GoodsPaid',@WhereQuery) > 0 OR CHARINDEX('Completed',@WhereQuery) > 0 )
		Set @QueryTables = @QueryTables + @OrdersTables
	--else
	--begin
	--	--Set @WhereQuery = REPLACE(@WhereQuery,'and ( IsSubOrder = ''false'' or IsSubOrder is null )','') 
	--	--Set @WhereQuery = REPLACE(@WhereQuery,'and ( IsSubOrder = ''true'' or IsSubOrder is not null )','') 
	--	--Set @WhereQuery = REPLACE(@WhereQuery,'and ( IsSubOrder = ''true'' )','') 
	--	--Set @WhereQuery = REPLACE(@WhereQuery,'and ( IsSubOrder = ''true'')','') 
	--	--Set @WhereQuery = REPLACE(@WhereQuery,'and IsSubOrder = ''true''','') 
		
	--end
	if (CHARINDEX('Commissions',@WhereQuery) > 0)
		Set @QueryTables = @QueryTables + @CommTables 
	end
		Set @WhereQuery = REPLACE(@WhereQuery,'ProjectStatus','dbo.ProjectTypes.ProjectType')
		Set @WhereQuery = REPLACE(@WhereQuery,'BranchID','dbo.Inquiries.BranchID')
		Set @WhereQuery = REPLACE(@WhereQuery,'ProjectSerialNumber','dbo.Inquiries.InquiryNumber')
		
		
		Set @Query = @Query + @QueryCols + ' from ' + @QueryTables + @WhereQuery
		--Print @QueryTables + ' --------- end Tables -------'
		--print @Query + ' --------- end Query -------'
		
		EXEC (@Query)
END
