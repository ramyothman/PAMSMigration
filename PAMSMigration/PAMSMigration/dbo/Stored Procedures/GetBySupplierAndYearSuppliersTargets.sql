-- =============================================
-- Author:		<Author,,Name>
-- Alter date: <Alter Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBySupplierAndYearSuppliersTargets]
	@SupplierID int,
	@Year int,
	@BranchID int
	AS
BEGIN
	SELECT *
  FROM [dbo].[SuppliersTargets]
  where SupplierID = @SupplierID and [Year] = @Year and [BranchID] = @BranchID
END
