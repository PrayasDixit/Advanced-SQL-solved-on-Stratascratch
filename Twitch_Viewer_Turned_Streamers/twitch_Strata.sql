with cte1 as(select user_id from(select user_id,session_start,session_id,session_type, rank() over (partition by user_id order by session_start) as rnk from twitch_sessions) temp_result where rnk=1 and session_type='viewer')

select user_id, count(*) as num_session from twitch_sessions where user_id in(select user_id from cte1) and session_type='streamer'
    group by 1
    order by count(*) desc,user_id;

#Prayas Dixit