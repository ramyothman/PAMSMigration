CREATE VIEW [dbo].[GetAllCustomerSupplierRegistration]
AS
SELECT     (cast(CASE WHEN p.ID = 0 THEN ROW_NUMBER() OVER (ORDER BY p.ID) * 100000 ELSE p.ID END AS int)) AS ID, p.CustomerID, p.UserName, p.ModifiedDate, 
p.CompanyCode, p.CompanyName, p.SupplierName, p.IsPrincipale, CASE WHEN RegistrationStatusID = 1 THEN p.RegistrationDate ELSE NULL END AS RegistrationDate, 
p.CustomerMarket, RegistrationStatusID, p.RegistrationStatus, 
/* CASE WHEN p.RegistrationStatusID = 1 THEN CAST('true' AS bit) ELSE CAST('false' AS bit) END AS IsRegistered, */ P.IsRegistered, COUNT(p.CommentsCount) 
AS CommentsCount, dbo.GetNumberOfClientRunningProjects(p.CustomerID, p.BranchID) AS RunningProjectsCount, p.SupplierID, 
CASE WHEN RegistrationStatusID = 3 THEN p.DeRegistrationDate ELSE NULL END AS DeRegistrationDate, p.BranchID , p.BranchNameFL
FROM         (SELECT     ISNULL(dbo.CustomerSupplierRegistration.ID, 0) AS ID, ISNULL(dbo.CustomerSupplierRegistration.CustomerID, 0) AS CustomerID, 
                                              dbo.CustomerSupplierRegistration.UserName, dbo.CustomerSupplierRegistration.ModifiedDate, dbo.Customers.CompanyCode, 
                                              dbo.Customers.CompanyName, dbo.Suppliers.SupplierName, dbo.Suppliers.IsPrincipale, dbo.CustomerSupplierRegistration.RegistrationDate, 
                                              dbo.CustomerMarkets.CustomerMarket, dbo.CustomerSupplierRegistration.RegistrationStatusID, dbo.RegistrationStatuses.RegistrationStatus, 
                                              dbo.CustomerSupplierRegistration.IsRegistered, 
                                              /*CASE WHEN dbo.CustomerSupplierRegistration.RegistrationStatusID = 1 THEN CAST('true' AS bit) ELSE CAST('false' AS bit) END AS IsRegistered, */ COUNT(dbo.CustomerSupplierRegistrationComments.CustomerSupplierRegistrationID)
                                               AS CommentsCount, dbo.GetNumberOfClientRunningProjects(dbo.CustomerSupplierRegistration.CustomerID, CustomerSupplierRegistration.BranchID) 
                                              AS RunningProjectsCount, dbo.Suppliers.SupplierID, dbo.CustomerSupplierRegistration.DeRegistrationDate, BranchID,CompanyBranches.BranchNameFL
                       FROM         Customers INNER JOIN
                      CustomerSupplierRegistration ON Customers.CustomerID = CustomerSupplierRegistration.CustomerID LEFT OUTER JOIN
                      CompanyBranches ON CustomerSupplierRegistration.BranchID = CompanyBranches.ID LEFT OUTER JOIN
                      Suppliers ON CustomerSupplierRegistration.SupplierID = Suppliers.SupplierID LEFT OUTER JOIN
                      CustomerSupplierRegistrationComments ON 
                      CustomerSupplierRegistration.ID = CustomerSupplierRegistrationComments.CustomerSupplierRegistrationID LEFT OUTER JOIN
                      RegistrationStatuses ON CustomerSupplierRegistration.RegistrationStatusID = RegistrationStatuses.ID LEFT OUTER JOIN
                      CustomerMarkets ON Customers.CustomerMarketID = CustomerMarkets.ID
                       GROUP BY dbo.CustomerSupplierRegistration.ID, dbo.CustomerSupplierRegistration.CustomerID, dbo.CustomerSupplierRegistration.UserName, 
                                              dbo.CustomerSupplierRegistration.ModifiedDate, dbo.Customers.CompanyCode, dbo.Customers.CompanyName, dbo.Suppliers.SupplierName, 
                                              dbo.Suppliers.IsPrincipale, dbo.CustomerSupplierRegistration.RegistrationDate, dbo.CustomerMarkets.CustomerMarket, 
                                              dbo.CustomerSupplierRegistration.RegistrationStatusID, dbo.RegistrationStatuses.RegistrationStatus, 
                                              /* CASE WHEN dbo.CustomerSupplierRegistration.RegistrationStatusID = 1 THEN CAST('true' AS bit) ELSE CAST('false' AS bit) END,*/ IsRegistered, 
                                              dbo.Suppliers.SupplierID, dbo.CustomerSupplierRegistration.DeRegistrationDate, BranchID,CompanyBranches.BranchNameFL
                       HAVING      (dbo.Suppliers.IsPrincipale = 1)/*) */ ) p
GROUP BY p.ID, p.CustomerID, p.UserName, p.ModifiedDate, p.CompanyCode, p.CompanyName, p.SupplierName, p.IsPrincipale, p.RegistrationDate, p.CustomerMarket, 
                      p.RegistrationStatusID, p.RegistrationStatus, p.IsRegistered , p.BranchNameFL ,
                      /*CASE WHEN p.RegistrationStatusID = 1 THEN CAST('true' AS bit) ELSE CAST('false' AS bit) END,*/ p.SupplierID, p.BranchID, p.DeRegistrationDate
