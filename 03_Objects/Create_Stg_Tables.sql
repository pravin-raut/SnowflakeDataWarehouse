--https://docs.snowflake.com/en/sql-reference/intro-summary-data-types
use database RETAIL;
use schema stg;


drop table if exists stg_Sales;
CREATE TABLE stg_Sales (
    CustomerID INT,
    ProductID INT,
    ProductPrice FLOAT,
    PurchaseDate DATE,
    StoreID smallint,
    PaymentID smallint,
    DiscountApplied BOOLEAN,
    DiscountPercent FLOAT,
    ProductCost FLOAT,
    Profit FLOAT,
    FootTraffic INT,
    InventoryLevel INT,
    MarketingExpenditure FLOAT,
    CompetitorPrice FLOAT
);

drop table if exists stg_Customer ;

CREATE TABLE stg_Customer (
    CustomerID INT,
    Age smallint,
    Gender VARCHAR(10),
    AnnualIncome FLOAT,
    SpendingScore INT
);

drop table if exists stg_Product ;
CREATE TABLE stg_Product (
    ProductID smallint,
    ProductCategory VARCHAR(50)
);
drop table if exists stg_Payment ;

CREATE TABLE stg_Payment (
    PaymentId INT,
    PaymentMethod VARCHAR(50)
);

drop table if exists stg_Store ;

CREATE TABLE stg_Store (
    StoreID INT,
    StoreLocation VARCHAR(100)
);

