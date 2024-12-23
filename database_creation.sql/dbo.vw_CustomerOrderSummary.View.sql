USE [CustomerDemoDB]
GO
/****** Object:  View [dbo].[vw_CustomerOrderSummary]    Script Date: 08/12/2024 22:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_CustomerOrderSummary] AS
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    c.Phone,
    COUNT(o.OrderID) AS TotalOrders,
    ISNULL(SUM(o.TotalAmount), 0) AS TotalAmountSpent,
    MAX(o.OrderDate) AS LastOrderDate
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone;
GO
