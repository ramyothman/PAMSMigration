-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSubInquiries]
	@ParentinquiryNumber nvarchar(50),
    @ResponsibleEngineerID int,
    @InquiryTypeID int,
    @CustomerID int,
    @CustomerInquiryNumber nvarchar(50),
    @ProjectID int,
    @ProductID int,
    @InquiryDate datetime,
    @BidDueDate datetime,
    @SupplierID int,   
    @ProductDescription varchar(150),
    @ShotecNo varchar(50),  
    @InquiryStatusID int, 
    @ProjectTypeID int ,	
	@ProductTypeID int,
	@BranchID int
	
AS
UPDATE [dbo].[Inquiries]
SET   
    ResponsibleEngineerID = @ResponsibleEngineerID,
    InquiryTypeID = @InquiryTypeID,
    CustomerID = @CustomerID,
    CustomerInquiryNumber = @CustomerInquiryNumber,
    ProjectID = @ProjectID,
    --ProductID = @ProductID,
    InquiryDate = @InquiryDate,
    BidDueDate = @BidDueDate,
    --SupplierID = @SupplierID,
   -- ProductDescription = @ProductDescription,
    ShotecNo = @ShotecNo,
    InquiryStatusID = @InquiryStatusID,
    BranchID  = @BranchID
   -- ProjectTypeID = @ProjectTypeID
WHERE [ParentInquiryNumber] = @ParentInquiryNumber and IsSubOffer = 'True'
