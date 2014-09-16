CREATE view  [dbo].[TradingCashFlow]
as
SELECT     PaidAmountCurrencyID, SUM(AmountInEuro) AS AmountInEuro, SUM(Amount) AS Amount, CommYear, CommMonth ,
 CompanyCode, SupplierName,   ResponsibleEngineer , 
   REPLACE(RIGHT(CONVERT(VARCHAR(11), 
                      CAST ( CAST(DATENAME(M, CAST(CAST(CommMonth AS nvarchar(2)) + '-' + '01' + '-' + CAST(CommYear AS nvarchar(4)) AS datetime)) AS nvarchar(3)) 
                      + ' ' + CAST(CommYear AS nvarchar(4)) as date ) , 106), 8), ' ', '-')   AS MonthYear ,
                     CAST(  CAST(DATENAME(M, CAST(CAST(CommMonth AS nvarchar(2)) + '-' + '01' + '-' + CAST(CommYear AS nvarchar(4)) AS datetime)) AS nvarchar(3)) 
                      + ' ' + CAST(CommYear AS nvarchar(4))  as date) as Dateval   
FROM         (SELECT     dbo.CustomerPayments.PaidAmountCurrencyID, dbo.Orders.PriceInEuro - dbo.CustomerPayments.PaidAmountInEuro AS AmountInEuro, 
                                              dbo.Orders.Price - dbo.CustomerPayments.PaidAmount AS Amount, YEAR(DATEADD(day, 30, dbo.Orders.ExpansionDeliveryDate)) AS CommYear, 
                                              MONTH(DATEADD(day, 30, dbo.Orders.ExpansionDeliveryDate)) AS CommMonth                                               
                                              , dbo.Customers.CompanyCode, 
                                              dbo.Suppliers.SupplierName, Person.PersonLanguages.DisplayName AS ResponsibleEngineer
                                              
                                              
                                              
                                              
                       FROM          dbo.CustomerPayments INNER JOIN
                                              dbo.Inquiries ON dbo.CustomerPayments.InquiryNumber = dbo.Inquiries.InquiryNumber INNER JOIN                                           
                                              Person.PersonLanguages ON dbo.Inquiries.ResponsibleEngineerID = Person.PersonLanguages.PersonId INNER JOIN
                                              dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID AND dbo.Inquiries.CustomerID = dbo.Customers.CustomerID INNER JOIN
                                              dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID AND dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                                              dbo.Orders ON dbo.Inquiries.InquiryNumber = dbo.Orders.InquiryNumber
                       WHERE      (dbo.Inquiries.SupplierID = 12) AND (dbo.Orders.Delivered = 0)
                       ) AS Comm
GROUP BY PaidAmountCurrencyID, CommYear, CommMonth, CompanyCode, SupplierName, ResponsibleEngineer 
