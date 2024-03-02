with cte1 as(select territory_id,order_value,extract(year from order_date) as yr, extract(quarter from order_date) as quart from fct_customer_sales as fcs inner join map_customer_territory as mct
on fcs.cust_id=mct.cust_id
where extract(year from order_date)=2021 and extract(quarter from order_date) in (3,4)),

cte2 as(select territory_id,yr,quart,sum(order_value) as tot from cte1
group by 1,2,3
order by 1,3)


select territory_id,((next_quart_total-tot)/tot)*100 as sales_growth from (select territory_id,yr,quart,tot, lead(tot) over(partition by territory_id order by quart) next_quart_total from cte2) as sub_temp where quart=3

#Prayas Dixit