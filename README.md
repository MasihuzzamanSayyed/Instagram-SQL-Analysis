# Instagram Tech Influencer: SQL Analysis

An in-depth SQL analysis of an Instagram tech influencer’s account over nine months to extract insights and improve content strategy.

---

## 📌 Project Overview

This project explores Instagram performance data using SQL to answer key business questions related to content performance, audience engagement, and follower growth.

The final output includes data-driven recommendations for growing an influencer's reach and refining their content approach.

---

## 🧰 Tools Used

- MySQL Workbench  
- SQL

---

## 🗃️ Dataset Structure

The database consists of three main tables:

- **dim_dates**: Contains calendar-related attributes (month, week number, weekday/weekend flags).
- **fact_account**: Daily account-level metrics (e.g., profile visits, new followers).
- **fact_content**: Metrics per content post (e.g., post type, impressions, likes, comments, saves).

SQL script to create and populate the database is in the `/datasets` folder.

---

## 📈 Analysis Objectives

The analysis answers 10 core business questions using SQL:

1. **Post Types**: Count unique post types.
2. **Impression Range**: Find max/min impressions per post type.
3. **Weekend Posts**: Filter all weekend posts from March and April.
4. **Monthly Growth**: Profile visits and new followers per month.
5. **Top July Categories**: Rank categories by total likes in July.
6. **Category Diversity**: Count unique post categories per month.
7. **Reach Breakdown**: Percentage of total reach by post type.
8. **Quarterly Engagement**: Comments and saves per category by quarter.
9. **Golden Days**: Top 3 follower-growth days each month.
10. **Reusable Reporting**: Stored procedure to report shares by post type for any week.


---

## 💡 Key Insights & Recommendations

### Insights:
- **Reels outperform other content types** in reach and follower growth.
- **Tech Tips and Gadget posts** consistently rank high in engagement.
- **Follower spikes** align with high-performing posts ("Golden Days").

### Recommendations:
- **Prioritize Reels**: Focus on short-form videos that deliver value.
- **Leverage Weekend Insights**: Tailor weekend content using past performance data.
- **Monthly Golden Day Review**: Identify and replicate top-performing strategies.

---

## 🚀 How To Reproduce

1. Clone this repository.
2. Load `gdb0120.sql` in MySQL Workbench to create the database.
3. Run `instagram_analysis_queries.sql` to execute all queries.

---


