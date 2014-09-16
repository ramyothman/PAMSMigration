-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDPartialOrder]
@PartialOrderID int 
AS
BEGIN
	SELECT *
  FROM [dbo].[PartialOrder]
where PartialOrderID = @PartialOrderID
END
