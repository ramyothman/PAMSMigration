CREATE PROCEDURE [dbo].[GetByIDOrders]
    @InquiryNumber nvarchar(50)
AS
BEGIN
SELECT Orders.*, Currencies.CurrencyName as Currency , 
                      PaymentTypes.PaymentType, PriceBase.PriceBaseCode
FROM         Orders INNER JOIN
                      PaymentTypes ON Orders.PaymentTypeID = PaymentTypes.ID INNER JOIN
                      PriceBase ON Orders.PriceBaseID = PriceBase.ID INNER JOIN
                      Currencies ON Orders.CurrencyID = Currencies.ID
WHERE [InquiryNumber] = @InquiryNumber
END
