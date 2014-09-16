CREATE VIEW [dbo].[GetAllInquiriesComments]
AS
SELECT     dbo.InquiriesComments.ID, dbo.InquiriesComments.InquiryNumber, dbo.InquiriesComments.Comment, dbo.InquiriesComments.UserName, 
                      dbo.InquiriesComments.ModifiedDate, dbo.InquiriesComments.ProjectTypeID, dbo.ProjectTypes.ProjectType
FROM         dbo.InquiriesComments LEFT OUTER JOIN
                      dbo.ProjectTypes ON dbo.InquiriesComments.ProjectTypeID = dbo.ProjectTypes.ID
