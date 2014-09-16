-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDProjectTypes]
@ID int
AS
BEGIN
	select *
  FROM [dbo].[ProjectTypes]
  where ID = @ID
END
