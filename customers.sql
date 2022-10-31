--git test 

with base as (
  select customer_id
    , name
    , email
    , count(*) as number_of_orders 
    , min(orders.created_at) as first_order_at  
  from `analytics-engineers-club.coffee_shop.customers` customers
  left join `analytics-engineers-club.coffee_shop.orders` orders on customers.id = orders.customer_id

  group by 1, 2, 3, 4
  )

select * from base
order by 5 asc
limit 5