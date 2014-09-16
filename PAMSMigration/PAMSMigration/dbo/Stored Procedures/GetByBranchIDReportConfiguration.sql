-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByBranchIDReportConfiguration]
@BranchID int
AS
BEGIN
SELECT *
  FROM [dbo].[ReportConfiguration]
 where BranchID = @BranchID
END
