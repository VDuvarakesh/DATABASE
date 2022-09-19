Select c.customer_id,c.first_name,sum(p.amount) AS Amount from payment p,customer c
where p.customer_id=c.customer_id
group by c.customer_id
order by Amount DESC;