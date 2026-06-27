-- Dim_custonmer
CREATE TABLE dim_customer (
    customer_key INT IDENTITY(1,1) PRIMARY KEY,
    customer_id NVARCHAR(50) UNIQUE,
    customer_unique_id NVARCHAR(50),
    customer_city NVARCHAR(100),
    customer_state NVARCHAR(10)
);

-- Dim_Product & translation
CREATE TABLE dim_product (
    product_key INT IDENTITY(1,1) PRIMARY KEY,
    product_id NVARCHAR(50) UNIQUE,
    product_category_name NVARCHAR(100),
    product_category_name_english NVARCHAR(100)
);

-- Dim_Date
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,         -- yyyymmdd
    full_date DATE,
    year INT,
    month INT,
    day INT,
    quarter INT
);

-- Dim_Seller
CREATE TABLE dim_seller (
    seller_key INT IDENTITY(1,1) PRIMARY KEY,
    seller_id NVARCHAR(50) UNIQUE
);

-- Dim_Payment_Type
CREATE TABLE dim_payment_type (
    payment_type_key INT IDENTITY(1,1) PRIMARY KEY,
    payment_type NVARCHAR(50) UNIQUE
);

-- Fact_table
CREATE TABLE fact_order_items (
    fact_id INT IDENTITY(1,1) PRIMARY KEY,

    order_id NVARCHAR(50),

    customer_key INT,
    product_key INT,
    seller_key INT,
    order_date_key INT,

    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    payment_value DECIMAL(10,2),
    review_score INT,

    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (seller_key) REFERENCES dim_seller(seller_key),
    FOREIGN KEY (order_date_key) REFERENCES dim_date(date_key)
);

-- Dim_date
DELETE FROM dim_date;

WITH dates AS (
    SELECT CAST('2015-01-01' AS DATE) AS d
    UNION ALL
    SELECT DATEADD(DAY, 1, d)
    FROM dates
    WHERE d < '2020-12-31'
)
INSERT INTO dim_date
SELECT
    CONVERT(INT, FORMAT(d, 'yyyyMMdd')) AS date_key,
    d AS full_date,
    YEAR(d),
    MONTH(d),
    DAY(d),
    DATEPART(QUARTER, d)
FROM dates
OPTION (MAXRECURSION 10000);

INSERT INTO dim_date
VALUES (-1, NULL, NULL, NULL, NULL, NULL);

