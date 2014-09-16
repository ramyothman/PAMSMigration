-- =============================================
-- Author:		<Author,,Name>
-- Alter date: <Alter Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDSuppliersTargets]
	@ID int 
	AS
BEGIN
	SELECT *
  FROM [dbo].[SuppliersTargets]
  where ID = @ID
END
