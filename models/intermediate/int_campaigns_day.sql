select
    date_date,
    sum(CAST(ads_cost AS float64)) as ads_cost,
    sum(impression) as ads_impression,
    sum(click) as ads_clicks
from {{ ref("int_campaigns") }}
group by date_date
order by date_date desc
