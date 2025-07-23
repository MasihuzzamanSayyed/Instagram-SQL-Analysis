[# Instagram-SQL-Analysis
An SQL-based analysis of a tech influencer's Instagram data to uncover insights on content performance and audience growth.](https://i.imgur.com/your_image_link.png" alt="Logo" width="120">

Instagram Tech Influencer: SQL Analysis

An in-depth analysis of Instagram performance data using SQL to derive actionable insights for content strategy and audience growth.




Explore the analysis »




https://github.com/your-username/Instagram-SQL-Analysis/blob/main/queries/instagram_analysis_queries.sql">View SQL Queries
·
https://github.com/your-username/Instagram-SQL-Analysis/blob/main/ppt/Instagram%20Analysis%20Presentation.pdf">View Presentation

📋 About The Project
This project involves a comprehensive analysis of an Instagram tech influencer's account data over a nine-month period. The primary objective was to answer 10 key business questions by writing SQL queries to explore content performance, engagement trends, and follower growth patterns. The final output includes a set of actionable recommendations to help refine the influencer's content strategy.

Tools Used:

MySQL Workbench

SQL

🗃️ Dataset
The analysis is based on a relational database consisting of three main tables:

dim_dates: A dimension table containing date-related attributes like month, week number, and weekday/weekend flags.

fact_account: A fact table with daily account-level metrics, including profile visits and new followers.

fact_content: A fact table with detailed metrics for each piece of content posted, including post type, category, impressions, reach, likes, comments, and saves.

The raw SQL script to create and populate this database is available in the /datasets folder.

📈 Analysis & Key Questions
The core of this project was to answer the following 10 questions using SQL:

Content Variety: How many unique post types are there?

Impression Range: What are the highest and lowest impressions for each post type?

Weekend Performance: Filter all posts from weekends in March and April.

Monthly Growth: Report total profile visits and new followers per month.

Top Categories in July: Rank post categories by total likes in July.

Content Diversity: Report unique post categories and their count per month.

Reach Distribution: What is the percentage breakdown of total reach by post type?

Quarterly Engagement: Report total comments and saves per category for each quarter.

"Golden" Follower Days: List the top 3 dates each month with the most new followers.

Reusable Reporting: Create a stored procedure to report shares by post type for any given week.

The complete SQL script with all queries can be found in /queries/instagram_analysis_queries.sql.

💡 Key Insights & Recommendations
The analysis revealed several actionable insights:

Insight 1: Reels Drive Growth: IG Reels are the primary engine for audience reach and new follower acquisition.

Insight 2: Topic is Key: "Tech Tips" and "Gadget" content consistently generate the highest engagement in terms of likes and saves.

Insight 3: Success is Measurable: Follower growth spikes can be directly attributed to specific, high-performing posts on "golden days."

Recommendations:

Double-Down on Reels: Prioritize short-form video content focusing on tech tips.

Create a Weekend Playbook: Use the filtered weekend data to define a winning content strategy for Saturdays and Sundays.

Implement a "Golden Day" Review: Establish a monthly process to analyze and replicate the content that led to the biggest follower spikes.

🚀 How To Reproduce
To replicate this analysis on your own local machine:

Download the gdb0120.sql file.

Load the .sql file into your MySQL Workbench instance and execute it to create the gdb0120 database.

Download and run the instagram_analysis_queries.sql file to perform the analysis.

(Important: Remember to replace your-username in the links with your actual GitHub username!))
