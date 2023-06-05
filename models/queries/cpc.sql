with
    cpc as (
        select channel, spend, clicks
        from {{ ref("source_twitter") }}

        union all

        select channel, spend, clicks
        from {{ ref("source_facebook") }}

        union all

        select channel, spend, clicks
        from {{ ref("source_bing") }}

        union all

        select channel, spend, clicks
        from {{ ref("source_tiktok") }}
    ),
    aggregated as (
        select channel, sum(spend) as total_spend, sum(clicks) as total_clicks
        from cpc
        group by channel
    )

select channel, round(total_spend / total_clicks, 2) as cpc
from aggregated
