{% snapshot product_snapshot %}

{{
    config(
      target_database='analytics',
      target_schema='public',
      unique_key='product_id',

      strategy='check',
      check_cols='all',
    )
}}

select * from {{ ref('stg_products') }}

{% endsnapshot %}