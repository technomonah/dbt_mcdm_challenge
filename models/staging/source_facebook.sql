with facebook_data as (
    select
    ad_id as ad_id,
    add_to_cart as add_to_cart,
    adset_id as adset_id,
    campaign_id as campaign_id,
    channel as channel,
    clicks as clicks,
    comments as comments,
    creative_id as creative_id,
    __insert_date as date,
    comments + shares + views + clicks + purchase as engagements,
    impressions as impressions,
    mobile_app_install as installs,
    likes as likes,
    inline_link_clicks as link_clicks,
    0 as placement_id,
    0 as post_click_conversions,
    0 as post_view_conversions,
    0 as posts,
    purchase as purchase,
    complete_registration as registrations,
    0 as revenue,
    shares as shares,
    spend as spend,
    purchase as total_conversions,
    views as video_views from {{ ref('src_ads_creative_facebook_all_data')}}
)

select * from facebook_data
