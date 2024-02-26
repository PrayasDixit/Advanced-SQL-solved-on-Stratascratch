with cte1 as(select extract(year from host_since) as year_started, count(id) as num_hosts, lag(count(id)) over (order by extract(year from host_since)) as prev_year_num from airbnb_search_details group by 1 order by 1)

select *,((num_hosts-prev_year_num)/prev_year_num)*100 as estimated_growth from cte1;

#Prayas Dixit