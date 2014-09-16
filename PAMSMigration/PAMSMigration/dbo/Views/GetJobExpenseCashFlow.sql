CREATE VIEW [dbo].[GetJobExpenseCashFlow]
AS
SELECT      SUM(TotalPriceInEuro) AS AmountInEuro,  CommYear, CommMonth,  SupplierName, 
                      ResponsibleEngineer ,
                      CAST(  CAST(DATENAME(M, CAST(CAST(CommMonth AS nvarchar(2)) + '-' + '01' + '-' + CAST(CommYear AS nvarchar(4)) AS datetime)) AS nvarchar(3)) 
                   + ' ' + CAST(CommYear AS nvarchar(4))  as datetime) as Dateval   
FROM         (
SELECT     
                                              dbo.Suppliers.SupplierName, Person.PersonLanguages.DisplayName AS ResponsibleEngineer,
                                              TotalPriceInEuro , Year(PurchaseDate) as CommYear , MONTH(PurchaseDate) as CommMonth
                                              
                      FROM         Inquiries INNER JOIN
                      Person.PersonLanguages ON Inquiries.ResponsibleEngineerID = Person.PersonLanguages.PersonId INNER JOIN
                      Suppliers ON Inquiries.SupplierID = Suppliers.SupplierID AND Inquiries.SupplierID = Suppliers.SupplierID INNER JOIN
                      CalculationSheet ON Inquiries.InquiryNumber = CalculationSheet.InquiryNumber INNER JOIN
                      PurchaseOrder ON CalculationSheet.CalculationSheetID = PurchaseOrder.CalculationSheetID
                                              
                                              
) AS Comm
GROUP BY  CommYear,CommMonth, SupplierName, ResponsibleEngineer
