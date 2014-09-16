-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteEmployeeHourRate]
@ID int
AS
BEGIN
DELETE FROM [dbo].[EmployeeHourRate]
      WHERE ID = @ID
END
