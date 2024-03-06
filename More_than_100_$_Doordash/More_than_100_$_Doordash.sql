with cte1 as(select restaurant_id,sales_amount,extract(year from actual_delivery_time) as yr, extract(month from actual_delivery_time) as mnth from delivery_orders as do left join order_value as ov
on do.delivery_id=ov.delivery_id where actual_delivery_time is not null),

cte2 as(select restaurant_id,yr,mnth,sum(sales_amount) as tot from cte1
group by 1,2,3
having yr=2021)

select mnth, 100*((sum(case when tot>=100 then 1 else 0 end))/count(*)) as perc_over_100 from cte2
group by 1

#Prayas Dixit