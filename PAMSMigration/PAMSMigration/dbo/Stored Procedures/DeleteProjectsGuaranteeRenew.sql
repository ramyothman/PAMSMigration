-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProjectsGuaranteeRenew]
          @ID int 
AS
BEGIN
Delete from ProjectsGuaranteeRenews where ID = @ID
END
