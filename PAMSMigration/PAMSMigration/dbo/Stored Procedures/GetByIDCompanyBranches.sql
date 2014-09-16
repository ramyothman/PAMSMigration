-- =============================================
-- Author:		<Author,,Name>
-- Alter date: <Alter Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDCompanyBranches]
	@ID int 
	AS
BEGIN
	SELECT *
  FROM [dbo].[CompanyBranches]
  where ID = @ID
END
