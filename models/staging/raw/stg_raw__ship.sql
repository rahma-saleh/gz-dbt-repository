with source as (
    select * from {{ source('raw', 'ship') }}
),
renamed as (
    select
        orders_id,
        shipping_fee,
        shipping_fee_1,
        logcost,
        ship_cost
    from source
),
cleaned as (
    select
        orders_id,
        shipping_fee,
        shipping_fee_1,
        logcost,
        ship_cost,
        -- Calculate the difference between shipping_fee and shipping_fee_1
        abs(shipping_fee - shipping_fee_1) as difference
    from renamed
    -- Filter out rows where the difference between shipping_fee and shipping_fee_1 is not null
    where difference is not null
)
select 
    orders_id,
    -- Keep only one of the shipping_fee or shipping_fee_1 columns based on your preference
    coalesce(shipping_fee, shipping_fee_1) as shipping_fee,
    logcost,
    ship_cost
from cleaned;