CREATE PROCEDURE [dbo].[GetYearlyHistoryByIDLosts]
    @InquiryNumber nvarchar(50),
    @LostReasonID int = 0 ,
    @Year int,
    @BranchID int
AS
BEGIN
if(@LostReasonID is not null and 
 @LostReasonID > 0)
SELECT     LostsYearlyHistory.LostID, LostsYearlyHistory.InquiryNumber, LostsYearlyHistory.LostReasonID, LostsYearlyHistory.Comment, LostsYearlyHistory.UserName, 
                      LostsYearlyHistory.ModifiedDate, LostsYearlyHistory.WinnerName, LostsYearlyHistory.WinnerPrice, LostsYearlyHistory.WinnerPriceInEuro, 
                      LostsYearlyHistory.RateToEuro, LostsYearlyHistory.RateDate, LostsYearlyHistory.WinnerPriceCurrencyID, LostsYearlyHistory.IsSubLost, 
                      LostsYearlyHistory.ParentInquiryNumber, LostsYearlyHistory.LostComment, LostsYearlyHistory.LostPrice, LostsYearlyHistory.LostPriceCurrencyID, 
                      LostsYearlyHistory.LostPriceRateToEuro, LostsYearlyHistory.LostPriceRateDate, LostsYearlyHistory.LostPriceInEuro, Inquiries.BranchID
FROM         LostsYearlyHistory INNER JOIN
                      InquiriesYearlyHistory ON LostsYearlyHistory.InquiryNumber = InquiriesYearlyHistory.InquiryNumber INNER JOIN
                      Inquiries ON LostsYearlyHistory.InquiryNumber COLLATE SQL_Latin1_General_CP1_CI_AS = Inquiries.InquiryNumber
WHERE LostsYearlyHistory.InquiryNumber = @InquiryNumber and LostReasonID = @LostReasonID 
        and InquiriesYearlyHistory.Year = @Year and Inquiries.BranchID = @BranchID
else
SELECT     LostsYearlyHistory.LostID, LostsYearlyHistory.InquiryNumber, LostsYearlyHistory.LostReasonID, LostsYearlyHistory.Comment, LostsYearlyHistory.UserName, 
                      LostsYearlyHistory.ModifiedDate, LostsYearlyHistory.WinnerName, LostsYearlyHistory.WinnerPrice, LostsYearlyHistory.WinnerPriceInEuro, 
                      LostsYearlyHistory.RateToEuro, LostsYearlyHistory.RateDate, LostsYearlyHistory.WinnerPriceCurrencyID, LostsYearlyHistory.IsSubLost, 
                      LostsYearlyHistory.ParentInquiryNumber, LostsYearlyHistory.LostComment, LostsYearlyHistory.LostPrice, LostsYearlyHistory.LostPriceCurrencyID, 
                      LostsYearlyHistory.LostPriceRateToEuro, LostsYearlyHistory.LostPriceRateDate, LostsYearlyHistory.LostPriceInEuro, Inquiries.BranchID
FROM         LostsYearlyHistory INNER JOIN
                      InquiriesYearlyHistory ON LostsYearlyHistory.InquiryNumber = InquiriesYearlyHistory.InquiryNumber INNER JOIN
                      Inquiries ON LostsYearlyHistory.InquiryNumber COLLATE SQL_Latin1_General_CP1_CI_AS = Inquiries.InquiryNumber
WHERE LostsYearlyHistory.InquiryNumber = @InquiryNumber and InquiriesYearlyHistory.Year = @Year and Inquiries.BranchID = @BranchID
END
