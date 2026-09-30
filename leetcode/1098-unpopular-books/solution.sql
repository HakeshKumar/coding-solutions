# Write your MySQL query statement below

 select book_id , name from (

select b.book_id,b.name, 

SUM(case  

when o.dispatch_date>'2018-06-23' THEN o.quantity ELSE 0 END)  as quantity

from books b left  join orders o on b.book_id =o.book_id
where  b.available_from  <= '2019-05-23' 
group by b.book_id,b.name ) a

where a.quantity<10
