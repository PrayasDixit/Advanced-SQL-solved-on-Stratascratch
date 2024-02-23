with cte1 as(select client_id,user_id,
sum(case when event_type='video call received' then 1
        when event_type='video call sent' then 1
        when event_type='voice call received' then 1
        when event_type='voice call sent' then 1
        else 0 end) as tot ,count(event_type) as cnt
        from fact_events group by 1,2)
        
select client_id from cte1
where tot>=cnt/2.0
group by 1
order by client_id
limit 1;
                  
#prayas dixit