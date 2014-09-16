-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDReportConfiguration]
@ID int
AS
BEGIN
SELECT *
  FROM [dbo].[ReportConfiguration]
 where ID = @ID
END
