/****** Object:  View [dbo].[GetAllPartialLosts]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPartialLosts]
AS
SELECT     PartialOrderID, LostReasonID, LostComment, Comment, UserName, ModifiedDate, WinnerName, WinnerPrice, WinnerPriceInEuro, RateToEuro, RateDate, 
                      WinnerPriceCurrencyID
FROM         dbo.PartialLost
