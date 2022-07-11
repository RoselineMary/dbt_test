{{
    config(
        materialized='table'
    )
}}
--select * from analytics.public.product_init
--select * from analytics.public.product_updates_1
select * from analytics.public.product_updates_2