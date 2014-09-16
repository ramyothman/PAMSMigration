-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDVisitAttendeesDetails]
	 @VisitAttendeesDetailsId INT
	 
	 AS
BEGIN
	SELECT *
  FROM [dbo].[GetAllVisitAttendeesDetails]
WHERE [VisitAttendeesDetailsId] = @VisitAttendeesDetailsId
END
