with cte1 as(select zipcode,CAST(Replace(host_response_rate,'%','') as UNSIGNED) as host_res_rate
from airbnb_search_details
where cleaning_fee=TRUE)

select zipcode, avg(host_res_rate) as resp_rate from cte1 where host_res_rate is not null
group by 1 order by 2

#Prayas Dixit