with cte1 as(select score,store_id,name,opening_date from instacart_reviews as inst_rev inner join instacart_stores as inst_str on inst_rev.store_id=inst_str.id
where extract(month from opening_date)>6 and extract(year from opening_date)=2021)

select name, (sum(case when score<5 then 1 else 0 end) ) / (sum(case when score>=5 then 1 else 0 end)) as negative_ratio from cte1 
    group by 1
    having (sum(case when score<5 then 1 else 0 end))> 0.2*((sum(case when score<5 then 1 else 0 end))+sum(case when score>=5 then 1 else 0 end));
    
#Prayas Dixit