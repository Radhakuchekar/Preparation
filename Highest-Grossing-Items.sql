-- reference : https://datalemur.com/questions/sql-highest-grossing
select category, product, total_spend
from 
    (SELECT category, product,
        sum(spend) as total_spend,
        rank() over (partition by category order by sum(spend) desc ) rn
    FROM product_spend
    where extract(year from transaction_date) =2022
    group by category, product
    ) summarized
where rn <=2
order by category;
-- filter year 2022
-- window category sum of spend
-- highest-grossing products

