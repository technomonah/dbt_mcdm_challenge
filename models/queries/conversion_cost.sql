with
    conversion_cost as (
        select channel, spend, total_conversions
        from {{ ref("source_facebook") }}
        union all
        select channel, spend, total_conversions
        from {{ ref("source_tiktok") }}
        union all
        select channel, spend, total_conversions
        from {{ ref("source_bing") }}
        union all
        select channel, 0 as spend, 0 as total_conversions
        from {{ ref("source_twitter") }}
    ),
    aggregated as (
        select channel, sum(spend) as total_spend, sum(total_conversions) as total_conversion_cost
        from conversion_cost
        group by channel
    )

select channel, round(ifnull(total_spend / nullif(total_conversion_cost, 0), 0), 2) as conversion_cost
from aggregated
