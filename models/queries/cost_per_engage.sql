with
    cost_per_engage as (
        select channel, spend, engagements
        from {{ ref("source_twitter") }}

        union all

        select
            channel,
            spend,
            (comments + shares + video_views + installs + link_clicks) as engagements
        from {{ ref("source_facebook") }}

        union all

        select channel, 0 as spend, 0 as engagements
        from {{ ref("source_bing") }}

        union all

        select channel, 0 as spend, 0 as engagements
        from {{ ref("source_tiktok") }}
    ),
    aggregated as (
        select channel, sum(spend) as total_spend, sum(engagements) as total_engagement
        from cost_per_engage
        group by channel
    )

select
    channel,
    round(ifnull(total_spend / nullif(total_engagement, 0), 0), 2) as cost_per_engage
from aggregated
