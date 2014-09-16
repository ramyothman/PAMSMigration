/****** Object:  View [dbo].[GetAllLosts]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllLosts]
AS
SELECT     InquiryNumber, LostReasonID, Comment, UserName, ModifiedDate, WinnerName, WinnerPrice, WinnerPriceInEuro, RateToEuro, RateDate, WinnerPriceCurrencyID, 
                      ParentInquiryNumber, LostComment, IsSubLost, LostPrice, LostPriceCurrencyID, LostPriceRateToEuro, LostPriceRateDate, LostPriceInEuro
FROM         dbo.Losts
