--select * from {{ ref('product') }}
select * from analytics.public.product_snapshot where dbt_valid_to is null 