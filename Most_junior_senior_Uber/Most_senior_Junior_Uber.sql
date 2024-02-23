with cte1 as(select *, datediff( coalesce(termination_date,curdate()),hire_date) date_diff
from uber_employees),

cte2 as(select id,first_name, last_name,date_diff from cte1 where date_diff in ((select max(date_diff) from cte1),(select min(date_diff) from cte1 where termination_date is Null)))

select ( select count(id) from cte2 where date_diff=(select max(date_diff) from cte1)) as longest_tenured_count, (select count(id) from cte2 where date_diff=(select min(date_diff) from cte2)) as shortest_tenured_count, (select max(date_diff)  -  min(date_diff) from cte2) as days_diff;

#prayas dixit
