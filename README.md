# **CustomerDemoDB**

`CustomerDemoDB` is a relational database designed to manage customer data, products, orders, and order details for a business. It supports operations like tracking customers, storing product information, processing orders, and analysing customer behaviour.

---

## **Database Schema**

### **Tables**

#### 1. **`Customers`**
- **Purpose**: Stores information about customers.
- **Columns**:
  - `CustomerID` (INT, PK): Unique identifier for each customer.
  - `FirstName` (NVARCHAR(50)): Customer's first name.
  - `LastName` (NVARCHAR(50)): Customer's last name.
  - `Email` (NVARCHAR(100)): Customer's email address.
  - `Phone` (NVARCHAR(15)): Customer's phone number.
  - `CreatedDate` (DATETIME2): Date when the customer record was created.

#### 2. **`Products`**
- **Purpose**: Stores information about products available for sale.
- **Columns**:
  - `ProductID` (INT, PK): Unique identifier for each product.
  - `ProductName` (NVARCHAR(100)): Name of the product.
  - `Price` (DECIMAL(10,2)): Price of the product.
  - `StockQuantity` (INT): Available stock for the product.
  - `CreatedDate` (DATETIME2): Date when the product record was created.

#### 3. **`Orders`**
- **Purpose**: Tracks orders placed by customers.
- **Columns**:
  - `OrderID` (INT, PK): Unique identifier for each order.
  - `CustomerID` (INT, FK): Links to the `Customers` table.
  - `OrderDate` (DATETIME2): Date the order was placed.
  - `TotalAmount` (DECIMAL(10,2)): Total amount for the order.

#### 4. **`OrderDetails`**
- **Purpose**: Stores details of each item in an order.
- **Columns**:
  - `OrderDetailID` (INT, PK): Unique identifier for each order detail record.
  - `OrderID` (INT, FK): Links to the `Orders` table.
  - `ProductID` (INT, FK): Links to the `Products` table.
  - `Quantity` (INT): Quantity of the product ordered.
  - `Price` (DECIMAL(10,2)): Price of the product at the time of the order.

---

### **Views**

#### `vw_CustomerOrderSummary`
- **Purpose**: Provides a summary of customer orders, including total orders, total amount spent, and the date of the last order.
- **Columns**:
  - `CustomerID`, `FirstName`, `LastName`, `Email`, `Phone`
  - `TotalOrders`: Total number of orders placed by the customer.
  - `TotalAmountSpent`: Total amount spent by the customer.
  - `LastOrderDate`: Date of the customer's most recent order.

---

## **Relationships**

- **Customers ↔ Orders**: A customer can have multiple orders (`1-to-Many`).
- **Orders ↔ OrderDetails**: An order can have multiple order details (`1-to-Many`).
- **Products ↔ OrderDetails**: A product can appear in multiple order details (`1-to-Many`).

---

## **Sample Queries**

### 1. **List All Customers**
```sql
SELECT * FROM Customers;
