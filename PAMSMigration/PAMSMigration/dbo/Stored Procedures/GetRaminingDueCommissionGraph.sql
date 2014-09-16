-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRaminingDueCommissionGraph]
@BranchID int
AS
BEGIN
	
	select Suppliers.SupplierID, SupplierName
	, isnull(dbo.GetSupplierCommissionRemain(Suppliers.SupplierID,@BranchID),0) RemainingCommission,
	isnull(dbo.GetSupplierCommissionDue(Suppliers.SupplierID,@BranchID),0) DueCommission 
	from Suppliers inner Join SupplierBranch 
	on Suppliers.SupplierID=SupplierBranch.SupplierID
	where IsPrincipale = 'True' and
	( BranchID = @BranchID OR IsGeneral = 'True')
	
	
END
