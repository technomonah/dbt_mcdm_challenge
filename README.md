# Marketing common data modelling challenge
Welcome to Marketing common data modelling challenge!

## Task
At Improvado, we use marketing common data models (MCDM) to consolidate data from various ad platforms into a single source for our clients. MCDM is an imaginary model that maps fields from diverse datasets onto a single table or view, providing a comprehensive set of data for a particular report.

However, let's imagine a scenario where one of our MCDMs, responsible for reporting on paid ad performance, is lost somehow. Adding to the issue, the analyst responsible for this particular MCDM is currently on vacation. 

But we got everything to recreate lost MCMD: raw data from the ad systems, the MCDM table structure for this report, and a internal dashboard.

In this situation, we need you to:
- Begin a new project in dbt Cloud, utilizing Google Big Query as the DWH.
- Use the raw data from the ad platforms and the MCDM table structure for the ads_basic_performance report to develop a corrected MCDM model:
	- The model must include data from all the provided ad platforms.
	- The model's columns must match the structure of the provided MCDM table.
	- The model should be simple to update with any new ad platforms that may be introduced.
- Recreate the [dashboard](https://lookerstudio.google.com/reporting/fa668749-b82f-41a8-a12e-f7d9c0733b57/page/tEnnC) using Google Looker Studio. Here are hints for metrics in dashboard:
	- *Cost per engage* is just a spended sum divided by sum of engagements
	- *Conversion cost* is calculated by dividing sum of spended by total conversions count
	- *Impressions by channel* is a sum of impressions for each channel
	- *CPC* gets like sum of spended divided by clicks count

### How to Submit
To submit the task, please send an email to [vladimir.kobzev@improvado.io](mailto:vladimir.kobzev@improvado.io) with the following completed steps:
-   A link to your dbt Cloud repository that contains the completed MCDM for the ads_basic_performance report.
-   A link to the recreated dashboard.
-   A brief set of instructions for adding data from new ad platforms into your MCDM.

## Required Tools
To complete this task, you will need the following tools:
-   dbt Cloud
-   Google Big Query
-   Google Looker Studio

### Tool Instructions
To help you get started, here are some resources on how to use the necessary tools:
-   dbt Courses:
    -   [dbt Fundamentals](https://courses.getdbt.com/courses/fundamentals). Relevant chapters include:
        -   Setting up dbt Cloud (17 minutes)
        -   Models and Sources (40 minutes)
        -   [dbt Cloud and BigQuery for Admins](https://courses.getdbt.com/courses/dbt-cloud-and-bigquery-for-admins) (35 minutes)
-   [How to Use Google BigQuery for FREE](https://levelup.gitconnected.com/how-to-use-google-bigquery-for-free-9c2a65e3a78c#)
- How to create dashboard Google Looker Studio with Google Big Query
		![](https://github.com/technomonah/dbt_mcdm_challenge/blob/main/how_to_export_gbq_to_looker.gif)


### Additional Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- [Short overview](https://improvado.io/products/mcdm) for Improvado MCDM

## How to Use the Repository
This is the foundational repository for your project. Clone it and start your dbt Cloud from it.

The repository includes raw data from various ad platforms, as well as the MCDM structure for the ads_basic_performance report, which are provided as seeds:

-   src_ads_bing_all_data
-   src_ads_creative_facebook_all_data
-   src_ads_tiktok_ads_all_data
-   src_promoted_tweets_twitter_all_data
-   mcdm_paid_ads_basic_performance_structure

To build the seeds, run `dbt seed` in the dbt Cloud console. Once the seeds have been built, you can access the data using `ref()`. For example, you can use `select * from {{ ref('src_ads_bing_all_data')}}` to access data from the `src_ads_bing_all_data` seed.

### Q&A
	Q: How to validate results for my model? 
	A: Compare your dashboard with the dashboard from task. If some numbers doesn't match, then some fiels in your model got incorrect mapped  

	Q: What if there're no MCDM sctructure field in raw datasource data?
	A: So you began the main goal of this task :)
	Suggest wich field or fields corresponds to MCDM ones by their meaning. If there're no such fields, then probably datasource just doesnt got them
