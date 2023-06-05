with bing_data as (
    select
    ad_id as ad_id,
    0 as add_to_cart,
    adset_id as adset_id,
    campaign_id as campaign_id,
    channel as channel,
    clicks as clicks,
    0 as comments,
    0 as creative_id,
    __insert_date as date,
    0 as engagements,
    imps as impressions,
    0 as installs,
    0 as likes,
    clicks as link_clicks,
    0 as placement_id,
    0 as post_click_conversions,
    0 as post_view_conversions,
    0 as posts,
    0 as purchase,
    0 as registrations,
    revenue as revenue,
    0 as shares,
    spend as spend,
    conv as total_conversions,
    0 as video_views from {{ ref('src_ads_bing_all_data') }}
)

select * from bing_data
