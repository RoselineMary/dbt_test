{{
    config(
        materialized='table'
    )
}}


with payments as (
    select 
    id as payment_id,
    orderid,
    paymentmethod,
    status,
    amount,
    created
    from {{ source('stripe', 'payment') }}
    --raw.stripe.payment
)

select * from payments