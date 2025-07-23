
-- Query 1: Unique Post Types
SELECT
    COUNT(DISTINCT post_type) AS unique_post_types
FROM
    fact_content;
    
-- Query 2: Highest and Lowest Impressions
SELECT
    post_type,
    MAX(impressions) AS highest_impressions,
    MIN(impressions) AS lowest_impressions
FROM
    fact_content
GROUP BY
    post_type;
    
-- Query 3: Weekend Posts in March & April
SELECT
    fc.*
FROM
    fact_content fc
JOIN
    dim_dates dd ON fc.date = dd.date
WHERE
    dd.month_name IN ('March', 'April') AND dd.weekday_or_weekend = 'Weekend';

-- Query 4: Monthly Account Statistics
SELECT
    dd.month_name,
    SUM(fa.profile_visits) AS total_profile_visits,
    SUM(fa.new_followers) AS total_new_followers
FROM
    fact_account fa
JOIN
    dim_dates dd ON fa.date = dd.date
GROUP BY
    dd.month_name
ORDER BY
    MONTH(fa.date); -- Order chronologically
    
-- Query 5: Total Likes per Category in July
WITH JulyLikes AS (
    SELECT
        fc.post_category,
        SUM(fc.likes) AS total_likes
    FROM
        fact_content fc
    JOIN
        dim_dates dd ON fc.date = dd.date
    WHERE
        dd.month_name = 'July'
    GROUP BY
        fc.post_category
)
SELECT
    post_category,
    total_likes
FROM
    JulyLikes
ORDER BY
    total_likes DESC;
    
-- Query 6: Post Category Counts per Month
SELECT
    dd.month_name,
    GROUP_CONCAT(DISTINCT fc.post_category ORDER BY fc.post_category SEPARATOR ', ') AS post_category_names,
    COUNT(DISTINCT fc.post_category) AS post_category_count
FROM
    fact_content fc
JOIN
    dim_dates dd ON fc.date = dd.date
GROUP BY
    dd.month_name
ORDER BY
    MONTH(fc.date);
    
-- Query 7: Percentage of Total Reach by Post Type
WITH PostReach AS (
    SELECT
        post_type,
        SUM(reach) AS total_reach
    FROM
        fact_content
    GROUP BY
        post_type
),
OverallReach AS (
    SELECT SUM(reach) AS overall_total_reach FROM fact_content
)
SELECT
    pr.post_type,
    pr.total_reach,
    (pr.total_reach / o.overall_total_reach) * 100 AS reach_percentage
FROM
    PostReach pr, OverallReach o
ORDER BY
    reach_percentage DESC;
    
-- Query 8: Quarterly Report on Comments and Saves
SELECT
    fc.post_category,
    CASE
        WHEN dd.month_name IN ('January', 'February', 'March') THEN 'Q1'
        WHEN dd.month_name IN ('April', 'May', 'June') THEN 'Q2'
        WHEN dd.month_name IN ('July', 'August', 'September') THEN 'Q3'
    END AS quarter,
    SUM(fc.comments) AS total_comments,
    SUM(fc.saves) AS total_saves
FROM
    fact_content fc
JOIN
    dim_dates dd ON fc.date = dd.date
GROUP BY
    fc.post_category, quarter
ORDER BY
    fc.post_category, quarter;
    
-- Query 9: Top 3 Dates for New Followers per Month
WITH RankedFollowers AS (
    SELECT
        dd.month_name AS month,
        fa.date,
        fa.new_followers,
        DENSE_RANK() OVER(PARTITION BY dd.month_name ORDER BY fa.new_followers DESC) as date_rank
    FROM
        fact_account fa
    JOIN
        dim_dates dd ON fa.date = dd.date
)
SELECT
    month,
    date,
    new_followers
FROM
    RankedFollowers
WHERE
    date_rank <= 3
ORDER BY
    MONTH(date), new_followers DESC;
    
-- Query 10: Stored Procedure for Weekly Shares
DELIMITER $$

CREATE PROCEDURE GetSharesByWeek(IN input_week_no VARCHAR(255))
BEGIN
    SELECT
        fc.post_type,
        SUM(fc.shares) AS total_shares
    FROM
        fact_content fc
    JOIN
        dim_dates dd ON fc.date = dd.date
    WHERE
        dd.week_no = input_week_no
    GROUP BY
        fc.post_type
    ORDER BY
        total_shares DESC;
END$$

DELIMITER ;

-- How to call the procedure:
CALL GetSharesByWeek('W10');

    