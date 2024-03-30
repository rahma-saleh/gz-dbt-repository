with 

source as (

    select * from {{ source('raw', 'adwords') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
       campaing_name AS campaign_name, -- Correcting the column name
        CAST(ads_cost AS float64) AS ads_cost,
        impression,
        click

    from source

)

select * from renamed