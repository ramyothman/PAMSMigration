-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDTemplate]
	      @ID int
           AS
BEGIN
SELECT *
  FROM [dbo].[Templates]
  WHERE ID = @ID
END
