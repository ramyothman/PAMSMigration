-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDProjectGuaranteeYearlyHistory]
@ID int 
AS
BEGIN
SELECT *
 FROM [dbo].[ProjectsGuaranteeYearlyHistory]
  where [ID] = @ID
END
