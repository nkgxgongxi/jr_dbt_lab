-- below script shows how we clean up the nations_raw table in bronze db/schema into dim_country table in silver db/schema.
-- we don't make many changes, but to normalize the column names in source table and highlight this table is a dimension table through its name.
select n_nationkey as country_key,
       n_name as country,
       n_regionkey as region_key
from jr_lab_db1.bronze.nations_raw;

-- below script shows how we clean up the regions_raw table in bronze db/schema into dim_region table in silver db/schema.
-- we don't make many changes, but to normalize the column names in source table and highlight this table is a dimension table through its name.
select r_regionkey as region_key,
       r_name as region
from jr_lab_db1.bronze.regions_raw;

-- below script shows how we clean up the customers_raw table in bronze db/schema into dim_customer table in silver db/schema.
-- we don't make many changes, but to normalize the column names in source table and highlight this table is a dimension table through its name.
select c_custkey as customer_key,
       c_name as customer,
       c_nationkey as country_key,
       c_mktsegment as market_segment
from jr_lab_db1.bronze.customers_raw;


-- below script shows how we clean up the customers_raw table in bronze db/schema into orders table in silver db/schema.
-- in this script we performed more clean-up tasks, including:
-- removing records with invalid total_price values (negative ones).
-- removing records without order date (all records should have some order date).
-- normalize order date column into Date format.
-- normalize column names.
select o.o_orderkey as order_key,
       o.o_orderdate::date as order_date,
       o.o_custkey as customer_key,
       o.o_totalprice as total_price
from jr_lab_db1.bronze.orders_raw o
where o.o_totalprice > 0 and o.o_orderdate is not null