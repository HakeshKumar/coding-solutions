select p.product_id,  
case when d.category IS NOT NULL THEN p.price + (-p.price * d.discount /100 ) ELSE p.price END as final_price ,
 p.category
from products p left join discounts d on p.category=d.category
