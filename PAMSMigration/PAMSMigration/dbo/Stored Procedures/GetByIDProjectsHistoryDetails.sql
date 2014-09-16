-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDProjectsHistoryDetails]
           @ID int
AS
BEGIN
	SELECT *
  FROM [dbo].[ProjectsHistoryDetails]
  where ID = @ID
END
