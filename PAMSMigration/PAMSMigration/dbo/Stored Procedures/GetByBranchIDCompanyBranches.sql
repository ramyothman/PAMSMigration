-- =============================================
-- Author:		<Author,,Name>
-- Alter date: <Alter Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByBranchIDCompanyBranches]
	@BranchID int 
	AS
BEGIN
	--SELECT *
 -- FROM [dbo].[CompanySettings]
 -- where BranchID = @BranchID
SELECT CompanyBranches.*,Currencies.CurrencyName, Currencies.CurrencyCode
 FROM         CompanyBranches LEFT OUTER JOIN
                      Currencies ON CompanyBranches.BaseCurrencyID = Currencies.ID AND CompanyBranches.BaseCurrencyID = Currencies.ID
  where CompanyBranches.ID = 1
END
