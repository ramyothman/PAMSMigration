-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProjectsGuarantee]
          @ID int 
AS
BEGIN
Delete from ProjectsGuaranteeRenews where GuaranteeID = @ID 
Delete from ProjectsGuarantee where ID = @ID
END
