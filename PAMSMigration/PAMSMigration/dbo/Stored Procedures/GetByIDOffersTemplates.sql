-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDOffersTemplates]
	      @ID int
           AS
BEGIN
SELECT *
  FROM [dbo].[OffersTemplates]
  WHERE ID = @ID
END
