-- SQL Queries

-- 1. Show names, ages, and genders of all users
SELECT name, age, gender FROM users;

-- 2. Find female users older than 40
SELECT * FROM users WHERE age > 40 AND gender = 'Female';

-- 3. List users sorted by age (oldest first)
SELECT name, age FROM users ORDER BY age DESC;

-- 4. Find average calories burned in all activity logs
SELECT AVG(calories_burned) AS avg_calories FROM activitylogs;

-- 5. Show users whose average mood rating is below 5
SELECT user_id, AVG(mood_rating) AS avg_mood 
FROM moodlogs 
GROUP BY user_id 
HAVING AVG(mood_rating) < 5;

-- 6. Show mood ratings along with user names
SELECT u.name, m.mood_rating, m.log_date 
FROM users u 
JOIN moodlogs m ON u.user_id = m.user_id;

-- 7. Show user name, region, meal type, and calories intake
SELECT u.name, r.region_name, d.meal_type, d.calories_intake 
FROM users u 
JOIN regions r ON u.region_id = r.region_id 
JOIN dietlogs d ON u.user_id = d.user_id;

-- 8. Count number of mood logs per user
SELECT name, age, 
    (SELECT COUNT(*) FROM moodlogs m WHERE m.user_id = u.user_id) AS mood_logs 
FROM users u;

-- 9. List users who burned more than 900 calories
SELECT name FROM users 
WHERE user_id IN (
    SELECT user_id FROM activitylogs WHERE calories_burned > 900
);

-- 10. List all users and their activity types, even if missing
SELECT u.name, a.activity_type 
FROM users u 
LEFT JOIN activitylogs a ON u.user_id = a.user_id;

-- 11. Show all diet logs along with user names
SELECT d.user_id, d.meal_type, u.name 
FROM dietlogs d 
RIGHT JOIN users u ON d.user_id = u.user_id;

-- 12. Count number of users in each region
SELECT region_id, COUNT(*) AS user_count 
FROM users 
GROUP BY region_id;

-- 13. Classify users by age group
SELECT name, 
       CASE 
           WHEN age < 30 THEN 'Young'
           WHEN age BETWEEN 30 AND 50 THEN 'Middle-aged'
           ELSE 'Senior'
       END AS age_group 
FROM users;

-- 14. Find max sleep hours per user
SELECT user_id, MAX(sleep_hours) AS max_sleep 
FROM wearabledata 
GROUP BY user_id;

-- 15. Use a CTE to show users who burned >700 calories
WITH HighCalories AS (
    SELECT user_id, calories_burned 
    FROM activitylogs 
    WHERE calories_burned > 700
)
SELECT u.name, h.calories_burned 
FROM HighCalories h 
JOIN users u ON h.user_id = u.user_id;

-- 16. Create a view to summarize user mood & activity
CREATE VIEW user_health_summary AS
SELECT u.user_id, u.name, AVG(m.mood_rating) AS avg_mood, AVG(a.calories_burned) AS avg_activity
FROM users u
LEFT JOIN moodlogs m ON u.user_id = m.user_id
LEFT JOIN activitylogs a ON u.user_id = a.user_id
GROUP BY u.user_id, u.name;

-- 17. Query the health summary view
SELECT * FROM user_health_summary WHERE avg_activity > 500;

-- 18. Find users who logged either mood or diet
SELECT user_id FROM moodlogs
UNION
SELECT user_id FROM dietlogs;

-- 19. Find users who logged both activity and wearable data
SELECT user_id FROM activitylogs
INTERSECT
SELECT user_id FROM wearabledata;

-- 20. Find users who never logged wearable data
SELECT user_id FROM users
EXCEPT
SELECT user_id FROM wearabledata;

-- 21. Find users aged between 30 and 50
SELECT name, age FROM users WHERE age BETWEEN 30 AND 50;

-- 22. Show users from selected regions
SELECT * FROM users WHERE region_id IN (1, 5, 10);

-- 23. List all unique activity types
SELECT DISTINCT activity_type FROM activitylogs;

-- 24. Extract date-based insights: Count how many activities were logged each day
SELECT activity_date, COUNT(*) AS activity_count
FROM activitylogs
GROUP BY activity_date
ORDER BY activity_date;


-- 25. Total calories burned by each user (summary)
SELECT user_id, SUM(calories_burned) AS total_burned 
FROM activitylogs 
GROUP BY user_id;






