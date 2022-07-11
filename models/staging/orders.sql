{{
    config(
        materialized='incremental',
        unique_key = 'order_id'
    )
}}

with orders as (
    select *
    from {{ ref('stg_orders')}}
    {% if is_incremental() %}
    --where order_date >=(select max(order_date) from {{this}})
    where order_date >=(select dateadd('day',-3, max(order_date)) from {{this}})
    {% endif %}
    --raw.jaffle_shop.orders

)

select * from orders