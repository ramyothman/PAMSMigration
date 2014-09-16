-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllEmployeeWorkLoadFullNew]
             @BranchID int
AS
BEGIN
declare @firmID as int
select @firmID = ID from InquiryTypes where InquiryType = 'Firm'
declare @BudgetID as int
select @BudgetID = ID from InquiryTypes where InquiryType = 'Budget'
select Person.[PersonLanguages].DisplayName,b.*,
          (InquiryCount + FirmOfferCount + BufdgetOfferCount + OrderCount ) as TotalCount,
           (InquiryValue + FirmOfferValue + BudgetOfferValue + OrderValue ) as TotalValue
 From  
(SELECT   distinct  ResponsibleEngineerID,
          dbo.[GetEmployeeWorkLoad](ResponsibleEngineerID,'INQUIRY','True',0,@BranchID) InquiryCount,
          dbo.[GetEmployeeWorkLoad](ResponsibleEngineerID,'INQUIRY','False',0,@BranchID) InquiryValue,
          dbo.[GetEmployeeWorkLoad](ResponsibleEngineerID,'Offer','True',@firmID,@BranchID) FirmOfferCount,
          dbo.[GetEmployeeWorkLoad](ResponsibleEngineerID,'Offer','False',@firmID,@BranchID) FirmOfferValue,
          dbo.[GetEmployeeWorkLoad](ResponsibleEngineerID,'Offer','True',@BudgetID,@BranchID) BufdgetOfferCount,
          dbo.[GetEmployeeWorkLoad](ResponsibleEngineerID,'Offer','False',@BudgetID,@BranchID) BudgetOfferValue,
          dbo.[GetEmployeeWorkLoad](ResponsibleEngineerID,'Order','True',0,@BranchID) OrderCount,
          dbo.[GetEmployeeWorkLoad](ResponsibleEngineerID,'Order','False',0,@BranchID) OrderValue , BranchID
FROM      dbo.[Inquiries]
where   ProjectTypeID IN (1,2,3)) as b,Person.PersonLanguages LEFT OUTER JOIN
                      PersonsBranches ON Person.PersonLanguages.PersonId = PersonsBranches.PersonID
where b.ResponsibleEngineerID = Person.[PersonLanguages].PersonId and LanguageId = 1 and b.BranchID = @BranchID
order by LTRIM(RTRIM(DisplayName))
END
