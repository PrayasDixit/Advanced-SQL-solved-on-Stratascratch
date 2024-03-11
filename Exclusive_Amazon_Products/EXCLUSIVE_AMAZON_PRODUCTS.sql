with cte1 as(select iac.product_name as prod_name,iac.brand_name,iac.mrp as mrp,iac.price,iac.rating
from innerwear_amazon_com as iac left join innerwear_topshop_com as itc 
on iac.product_name=itc.product_name and iac.mrp=itc.mrp 
where itc.mrp is Null and itc.product_name is Null)

select prod_name,cte1.brand_name,cte1.price,cte1.rating from cte1 
left join innerwear_macys_com as imc on cte1.prod_name=imc.product_name and cte1.mrp=imc.mrp 
where imc.mrp is Null and imc.product_name is Null

