with
    impressions_view as (
        select channel, impressions
        from {{ ref("source_twitter") }}

        union all

        select channel, impressions
        from {{ ref("source_facebook") }}

        union all

        select channel, impressions
        from {{ ref("source_bing") }}
    
        union all
    
        select channel, impressions
        from {{ ref("source_tiktok") }}
    )

select channel, sum(impressions) as impressions
from impressions_view
group by channel
