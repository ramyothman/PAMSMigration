-- =============================================
-- Author:		<Author,,Name>
-- Alter date: <Alter Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDCompanySettings]
	@ID int 
	AS
BEGIN
	SELECT *
  FROM [dbo].[CompanySettings]
  where ID = @ID
END
