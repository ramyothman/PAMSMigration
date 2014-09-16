-- =============================================
-- Author:		<Author,,Name>
-- Alter date: <Alter Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDCompanyBranchesCountries]
	@ID int 
	AS
BEGIN
	SELECT *
  FROM [dbo].[CompanyBranchesCountries]
  where ID = @ID
END
