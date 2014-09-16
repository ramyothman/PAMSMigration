CREATE FUNCTION [dbo].[GetPrevState] 
(
   @InquiryNumber nvarchar(50),
   @ProjectTypeID int
	-- Add the parameters for the function here
)
RETURNS nvarchar(50)
AS
BEGIN
	
	declare @res nvarchar(50)	
	declare @StatusID int 
	
	SELECT @StatusID = ProjectsHistory.ProjectTypeID
    FROM    Inquiries INNER JOIN
            ProjectsHistory ON 
            Inquiries.InquiryNumber = ProjectsHistory.InquiryNumber
    Where Inquiries.InquiryNumber = @InquiryNumber 
     and ProjectsHistory.ModifiedDate = (select max(ProjectsHistory.ModifiedDate)
                        from ProjectsHistory
                        where InquiryNumber =  @InquiryNumber and 
                              ProjectTypeID <> @ProjectTypeID)
                              
     select @res = ProjectType
     from ProjectTypes 
     where ID = @StatusID                         
                              
	return @res
END
