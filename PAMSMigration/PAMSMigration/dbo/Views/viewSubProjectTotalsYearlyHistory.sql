CREATE VIEW [dbo].[viewSubProjectTotalsYearlyHistory]
AS
SELECT     *
FROM         (SELECT     GetAllInquiriesYearlyHistory.CustomerID, GetAllInquiriesYearlyHistory.SupplierID, GetAllInquiriesYearlyHistory.InquiryStatus AS OfferStatus, 
                                              Customers.CompanyName, Customers.CompanyCode, Suppliers.SupplierName, OrdersYearlyHistory.OrderDate, OrdersYearlyHistory.DeliveredON, 
                                              OrdersYearlyHistory.Delivered, GetAllInquiriesYearlyHistory.InquiryDate, OrdersYearlyHistory.PriceInEuro, 
                                              GetAllInquiriesYearlyHistory.QuotationPriceInEuro, LostsYearlyHistory.ModifiedDate AS LostDate, OrdersYearlyHistory.OrderStatusID, 
                                              OrderStatus.Name AS OrderStatus, GetAllInquiriesYearlyHistory.OfferDate, LostsYearlyHistory.LostReasonID, LostReasons.ReasonName, 
                                              LostReasons.ReasonCode AS LostReasonCode, GetAllInquiriesYearlyHistory.InquiryNumber, GetAllInquiriesYearlyHistory.InquiryTypeID, 
                                              GetAllInquiriesYearlyHistory.InquiryStatusID, InquiryStatus.Name AS InquiryStatusName, OrdersYearlyHistory.IsSubOrder, 
                                              GetAllInquiriesYearlyHistory.ProductTypeID, GetAllInquiriesYearlyHistory.IsSubOffer, PartialShipmentYearlyHistory.ShipmentDate, 
                                              PartialShipmentYearlyHistory.PriceInEuro AS ShipmentPriceInEuro, OrdersYearlyHistory.BackLog, Suppliers.IsPrincipale, Suppliers.HasSubSuppliers, 
                                              GetAllInquiriesYearlyHistory.ProjectTypeID, GetAllInquiriesYearlyHistory.InquiryType, GetAllInquiriesYearlyHistory.Year, 
                                              GetAllInquiriesYearlyHistory.ProjectStatus AS InquiryStatus, OrdersYearlyHistory.CompletedGoodsPaidON, OrdersYearlyHistory.IsCompletedGoodsPaid, 
                                              CompletedProjects.ModifiedDate AS CompletedOn, [dbo].[GetTotalGoodsPaid](GetAllInquiriesYearlyHistory.InquiryNumber) PaidAmountInEuro, BranchID ,
                                              Row_Number() OVER (PARTITION BY GetAllInquiriesYearlyHistory.InquiryNumber
                       ORDER BY GetAllInquiriesYearlyHistory.InquiryNumber) AS row
FROM         LostReasons LEFT OUTER JOIN
                      LostsYearlyHistory ON LostReasons.ID = LostsYearlyHistory.LostReasonID RIGHT OUTER JOIN
                      CompletedProjects RIGHT OUTER JOIN
                      GetAllInquiriesYearlyHistory ON 
                      CompletedProjects.InquiryNumber = GetAllInquiriesYearlyHistory.InquiryNumber COLLATE SQL_Latin1_General_CP1_CI_AS LEFT OUTER JOIN
                      PartialShipmentYearlyHistory ON GetAllInquiriesYearlyHistory.InquiryNumber = PartialShipmentYearlyHistory.InquiryNumber LEFT OUTER JOIN
                      InquiryStatus ON GetAllInquiriesYearlyHistory.InquiryStatusID = InquiryStatus.ID ON 
                      LostsYearlyHistory.InquiryNumber = GetAllInquiriesYearlyHistory.InquiryNumber LEFT OUTER JOIN
                      Customers ON GetAllInquiriesYearlyHistory.CustomerID = Customers.CustomerID LEFT OUTER JOIN
                      Suppliers ON GetAllInquiriesYearlyHistory.SupplierID = Suppliers.SupplierID LEFT OUTER JOIN
                      OrdersYearlyHistory ON GetAllInquiriesYearlyHistory.InquiryNumber = OrdersYearlyHistory.InquiryNumber LEFT OUTER JOIN
                      OrderStatus ON OrdersYearlyHistory.OrderStatusID = OrderStatus.ID) AS t
WHERE     t .row = 1
