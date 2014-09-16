-- =============================================
-- Author:		<Author,,Name>
-- Alter date: <Alter Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByBranchIDCompanySettings]
	@BranchID int 
	AS
BEGIN
	SELECT *
  FROM [dbo].[CompanySettings]
  where BranchID = @BranchID
END
