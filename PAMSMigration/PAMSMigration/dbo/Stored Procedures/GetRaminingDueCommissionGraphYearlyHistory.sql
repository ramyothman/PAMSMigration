-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRaminingDueCommissionGraphYearlyHistory]
 @Year int,
 @BranchID int
AS
BEGIN
	
	select SupplierID, SupplierName, dbo.GetSupplierCommissionRemainYearlyHistory(SupplierID,@Year,@BranchID) RemainingCommission,
	dbo.GetSupplierCommissionDueYearlyHistory(SupplierID,@Year,@BranchID) DueCommission from Suppliers where IsPrincipale = 'True'
	
	
END
