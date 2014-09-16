-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllSupplierWorkLoadFullNew]
             @BranchID int
AS
BEGIN
declare @firmID as int
select @firmID = ID from InquiryTypes where InquiryType = 'Firm'
declare @BudgetID as int
select @BudgetID = ID from InquiryTypes where InquiryType = 'Budget'
select dbo.[vw_SupplierBranches].SupplierName,b.*,
          (InquiryCount + FirmOfferCount + BufdgetOfferCount + OrderCount ) as TotalCount,
           (InquiryValue + FirmOfferValue + BudgetOfferValue + OrderValue ) as TotalValue
 From  
(SELECT   distinct  SupplierID,
          dbo.[GetSupplierWorkLoad](SupplierID,'INQUIRY','True',0,@BranchID) InquiryCount,
          dbo.[GetSupplierWorkLoad](SupplierID,'INQUIRY','False',0,@BranchID) InquiryValue,
          dbo.[GetSupplierWorkLoad](SupplierID,'Offer','True',@firmID,@BranchID) FirmOfferCount,
          dbo.[GetSupplierWorkLoad](SupplierID,'Offer','False',@firmID,@BranchID) FirmOfferValue,
          dbo.[GetSupplierWorkLoad](SupplierID,'Offer','True',@BudgetID,@BranchID) BufdgetOfferCount,
          dbo.[GetSupplierWorkLoad](SupplierID,'Offer','False',@BudgetID,@BranchID) BudgetOfferValue,
          dbo.[GetSupplierWorkLoad](SupplierID,'Order','True',0,@BranchID) OrderCount,
          dbo.[GetSupplierWorkLoad](SupplierID,'Order','False',0,@BranchID) OrderValue
FROM      dbo.[Inquiries]
where ProjectTypeID IN (1,2,3)) as b,dbo.vw_SupplierBranches
where b.SupplierID = dbo.[vw_SupplierBranches].SupplierID 
and (BranchID = @BranchID or IsGeneral = 'True')
order by LTRIM(RTRIM(SupplierName))
END
