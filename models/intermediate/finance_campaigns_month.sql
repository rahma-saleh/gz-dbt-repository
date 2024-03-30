select
    date_trunc(date_date, month) as datemonth,
    sum(operational_margin - ads_cost) as ads_margin,
    round(sum(average_basket), 2) as average_basket,
    sum(operational_margin) as operational_margin,
    sum(ds_cost) as ads_cost,
    sum(ads_impression) as ads_impression,
    sum(ads_clicks) as ads_clicks,
    sum(quantity) as quantity,
    sum(revenue) as revenue,
    sum(purchase_cost) as purchase_cost,
    sum(margin) as margin,
    sum(shipping_fee) as shipping_fee,
    sum(logcost) as logcost,
    sum(cast(ship_cost as float64)) as ship_cost,
from {{ ref("int_campaigns_day") }}
full outer join {{ ref("finance_days") }} using (date_date)
group by datemonth
order by datemonth desc
