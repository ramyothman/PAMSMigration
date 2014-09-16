Create PROCEDURE [dbo].[GetCustomerPaymentsByInvoiceNumber]
    
    @InquiryNumber nvarchar(50),
    @InvoiceNumber nvarchar(50)
    
AS
select * From CustomerPayments
WHERE InquiryNumber = @InquiryNumber and InvoiceNumber = @InvoiceNumber
