select distinct category
from zepto
order by category;
select outofstock,COUNT(sku_id)
from zepto 
group by outofstock;

select name, count(sku_id) as "NUMBER OF SKUs"
FROM zepto
group by name
having count(sku_id) >1
ORDER BY count(sku_id) desc;

SELECT * FROM zepto
WHERE mrp = 0 OR discountedsellingprice=0;

delete from zepto
where mrp =0;

update zepto
SET mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;


select DISTINCT name,mrp,discountpercent
from zepto
ORDER by discountpercent desc
LIMIT 10;

select mrp, discountedsellingprice from zepto

SELECT DISTINCT name,mrp
FROM zepto
WHERE outofstock = TRUE and mrp>300
ORDER BY mrp DESC;

SELECT CATEGORY,
SUM(discountedsellingprice * availablequantity) as total_revenue
from zepto
group by category
order by total_revenue;

SELECT DISTINCT name mrp, discountpercent
FROM zepto
where mrp > 500 AND discountpercent <10
order by mrp desc,discountpercent desc;

SELECT CATEGORY,
ROUND (AVG(discountpercent),2) AS avg_discount
from zepto 
GROUP BY CATEGORY
ORDER BY AVG_DISCOUNT DESC
LIMIT 5;

SELECT DISTINCT name, weightingms , discountedsellingprice,
round(discountedsellingprice/weightingms,2) as price_per_gram
from zepto
where weightingms >= 100
order by price_per_gram;

select distinct name weightingms,
case when weightingms < 1000 then 'low'
     when weightingms < 5000 then 'medium'
	 else  'bulk'
	 end as weight_category
	 from zepto;

select category,
SUM(weightingms * availablequantity) as total_weight
from zepto
group  by category
order by total_weight;