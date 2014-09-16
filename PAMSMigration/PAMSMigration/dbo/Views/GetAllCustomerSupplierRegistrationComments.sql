CREATE VIEW [dbo].[GetAllCustomerSupplierRegistrationComments]
AS
SELECT     ID, CustomerSupplierRegistrationID, Comment, UserName, ModifiedDate
FROM         dbo.CustomerSupplierRegistrationComments
