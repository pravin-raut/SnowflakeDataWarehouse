use database retail;
use schema stg;

COPY INTO stg_Customer (CustomerID,Age,Gender,AnnualIncome,SpendingScore)
from
(
select
s.$1,s.$2,s.$3,s.$4,s.$5
 from @my_external_stage/customer/ s

) FILE_FORMAT = (FORMAT_NAME = csv_format);



COPY INTO stg_Payment (PaymentMethod,PaymentId)
FROM (
    SELECT s.$1, s.$2
    FROM @my_external_stage/payment/ s
)
FILE_FORMAT = (FORMAT_NAME = csv_format);

use database retail;
use schema stg;

COPY INTO stg_Product (ProductID,ProductCategory)
FROM (
    SELECT s.$1, s.$2
    FROM @my_external_stage/product/ s
)
FILE_FORMAT = (FORMAT_NAME = csv_format)


USE DATABASE retail;
USE SCHEMA stg;

COPY INTO STG_SALES(
    CustomerID, ProductID, ProductPrice, PurchaseDate, StoreID, 
    PaymentID, DiscountApplied, DiscountPercent, ProductCost, 
    Profit, FootTraffic, InventoryLevel, MarketingExpenditure, CompetitorPrice
)
FROM (
    SELECT 
        s.$1,
        s.$2,
        s.$3,
        TO_DATE(s.$4 ,'DD-MM-YYYY'), -- Adjusted format here
        s.$5,
        s.$6,
        s.$7::BOOLEAN,
        s.$8,
        s.$9,
        s.$10,
        s.$11,
        s.$12,
        s.$13,
        s.$14
    FROM @my_external_stage/sales/ s
) FILE_FORMAT = (FORMAT_NAME = csv_format);


use database retail;
use schema stg;

COPY INTO stg_Store (StoreID, StoreLocation)
FROM (
    SELECT s.$1, s.$2
    FROM @my_external_stage/store/ s
)
FILE_FORMAT = (FORMAT_NAME = csv_format)