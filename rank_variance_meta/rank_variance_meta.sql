with cte1 as(select fau.user_id,fcc.number_of_comments, extract(month from created_at) as mnth, extract(year from created_at) as yr,fau.country from fb_comments_count as fcc inner join fb_active_users fau
on fcc.user_id=fau.user_id),

cte2 as(select mnth,yr,country,sum(number_of_comments) as tot_cmnt from cte1
group by 1,2,3),

cte3 as(select mnth,yr,country,dense_rank() over(partition by mnth,yr order by tot_cmnt desc) rnk from cte2 where mnth in (12,1) and yr in(2019,2020)),

cte4 as(select * from cte3 where mnth=12 and yr=2019),
cte5 as(select * from cte3 where mnth=1 and yr=2020),

cte6 as(select cte5.country,cte5.rnk as rnk_jan, coalesce(cte4.rnk,1000) as rnk_dec from cte5 left join cte4 on cte5.country=cte4.country)

select country from cte6 where rnk_dec>rnk_jan;
#prayas dixit