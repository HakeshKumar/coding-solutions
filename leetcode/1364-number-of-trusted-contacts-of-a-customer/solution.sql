# Write your MySQL query statement below
with contacts_trusted_contacts as 
(

    select user_id, count(*) as contacts_cnt, 
    sum( case when contact_email IN ( select email from customers) THEN 1 ELSE 0 END ) as trusted_contacts_cnt
    from contacts
    group by user_id
),
joined as 
(select i.invoice_id,cu.customer_id, cu.customer_name,i.price
from invoices i left join customers cu on i.user_id=cu.customer_id)

select j.invoice_id, j.customer_name, j.price, case when new.contacts_cnt IS NULL THEN 0 ELSE new.contacts_cnt END as contacts_cnt, 
case when new.trusted_contacts_cnt IS NULL THEN 0 ELSE new.trusted_contacts_cnt END as trusted_contacts_cnt
 
 from joined j left join contacts_trusted_contacts new on j.customer_id=new.user_id
 order by j.invoice_id
