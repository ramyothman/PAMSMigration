CREATE PROCEDURE [dbo].[GetByIDCompletedProjects]
    @InquiryNumber nvarchar(50)
AS
BEGIN
SELECT *
  FROM [dbo].[CompletedProjects]
WHERE [InquiryNumber] = @InquiryNumber
END
