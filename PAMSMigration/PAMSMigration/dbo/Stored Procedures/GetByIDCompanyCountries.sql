-- =============================================
-- Author:		<Author,,Name>
-- Alter date: <Alter Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDCompanyCountries]
	@ID int 
	AS
BEGIN
	SELECT *
  FROM [dbo].[CompanyCountries]
  where ID = @ID
END
