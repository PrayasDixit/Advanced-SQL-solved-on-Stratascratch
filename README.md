# Here is the Query
with cte1 as(select territory_id,prod_brand, extract(quarter from order_date) as quart,extract(year from order_date) as yr from fct_customer_sales as fcs
inner join map_customer_territory as mct
on fcs.cust_id=mct.cust_id
inner join dim_product dp
on fcs.prod_sku_id=dp.prod_sku_id),

cte2 as (select territory_id,prod_brand,count(prod_brand) over(partition by territory_id,prod_brand) as cnt1, count(prod_brand) over(partition by territory_id) as cnt2 from cte1 where quart=04 and yr=2021)

select distinct territory_id, prod_brand, (cnt1/cnt2)*100 as Market_Share from cte2 where (cnt1/cnt2)*100!=0 ;
