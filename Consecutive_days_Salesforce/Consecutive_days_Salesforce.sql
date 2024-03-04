with cte1 as (select user_id,date,lead(date) over(partition by user_id order by date) as next_date,lead(date,2) over(partition by user_id order by date) as next_next_date from sf_events),

cte2 as(select user_id,datediff(next_date,date) as date_diff_1,datediff(next_next_date,next_date) as date_diff_2 from cte1)

select distinct user_id from cte2 where (date_diff_1+date_diff_2)=2

#Prayas Dixit