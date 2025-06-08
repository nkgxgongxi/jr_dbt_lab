-- below script aggregates data from transaction table and dimension tables into a presentation view that business can leverage. 
-- we can see that the grain of data is on <region, country, order_date> level, meaning that there shouldn't be duplication of records at this level.
-- we can observe the benefits brought from bronze to silver clean-up as the logic is much more clear and the column reference is more straightforward.
with prep as (
    select o.order_date, c.customer, o.total_price,
           ctry.country,
           r.region
    from jr_lab_db1.silver.orders o join jr_lab_db1.silver.dim_customer c
    on o.customer_key = c.customer_key
    join jr_lab_db1.silver.dim_country ctry 
    on c.country_key = ctry.country_key
    join jr_lab_db1.silver.dim_region r 
    on ctry.region_key = r.region_key
)
select distinct region, country, order_date, sum(total_price) as sales
from prep
group by region, country, order_date;