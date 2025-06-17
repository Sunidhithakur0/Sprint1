create database HealthCare360;

use HealthCare360;
-- Table: Regions
CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(255)
);

-- Table: Users
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    email VARCHAR(100) UNIQUE,
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Table: MoodLogs
CREATE TABLE moodlogs (
    mood_id INT PRIMARY KEY,
    user_id INT,
    mood_rating INT CHECK (mood_rating BETWEEN 1 AND 10),
    log_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: ActivityLogs
CREATE TABLE activitylogs (
    activity_id INT PRIMARY KEY,
    user_id INT,
    activity_type VARCHAR(50),
    duration_mins INT CHECK (duration_mins >= 0),
    calories_burned INT,
    activity_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: DietLogs
CREATE TABLE dietlogs (
    diet_id INT PRIMARY KEY,
    user_id INT,
    meal_type VARCHAR(20),
    food_items TEXT,
    calories_intake INT,
    meal_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: WearableData
CREATE TABLE wearabledata (
    wearable_id INT PRIMARY KEY,
    user_id INT,
    timestamp DATETIME,
    heart_rate INT,
    steps_count INT,
    sleep_hours FLOAT CHECK (sleep_hours >= 0),
    device_name VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
INSERT INTO regions (region_id, region_name) VALUES
(1, 'Meganborough, Venezuela'),
(2, 'Murphyfurt, Zimbabwe'),
(3, 'Hicksmouth, Turkey'),
(4, 'Armstrongtown, Japan'),
(5, 'Lake Sarahburgh, Ethiopia'),
(6, 'Moranfort, United States of America'),
(7, 'East Veronica, Anguilla'),
(8, 'West Joseph, Finland'),
(9, 'Sanfordfurt, Montenegro'),
(10, 'Lake Annaburgh, Croatia'),
(11, 'Edwardport, Falkland Islands (Malvinas)'),
(12, 'Port Samuel, Tunisia'),
(13, 'Port Danielborough, Cambodia'),
(14, 'West Brittanymouth, Afghanistan'),
(15, 'Anthonyfurt, Saint Lucia'),
(16, 'Port John, Myanmar'),
(17, 'Banksberg, Uzbekistan'),
(18, 'Travisfurt, Svalbard & Jan Mayen Islands'),
(19, 'Andrewport, Bahrain'),
(20, 'Port Amy, Peru');

INSERT INTO users (user_id, name, age, gender, email, region_id) VALUES
(1, 'Richard Cooper', 45, 'Other', 'cochrancharles@wells.net', 5),
(2, 'Elizabeth Hayes', 63, 'Female', 'jonesmary@ross.com', 12),
(3, 'Jessica Greer', 59, 'Female', 'xlevy@yahoo.com', 15),
(4, 'Robert Martinez', 36, 'Male', 'bauerjoshua@hotmail.com', 10),
(5, 'Jason Farley', 36, 'Female', 'jaime88@yahoo.com', 20),
(6, 'Sean Stanley', 39, 'Female', 'jacqueline93@hotmail.com', 1),
(7, 'Mr. Scott Brock', 38, 'Other', 'christinakeller@curry-perry.info', 16),
(8, 'Ashley Cline', 31, 'Female', 'nbautista@hotmail.com', 5),
(9, 'Kevin Jackson', 57, 'Female', 'jprice@yahoo.com', 15),
(10, 'Erica Hurley', 21, 'Other', 'manuel04@hotmail.com', 19),
(11, 'James Warner', 43, 'Other', 'hthompson@vasquez-nelson.com', 20),
(12, 'David Lopez', 58, 'Female', 'alexander02@gmail.com', 5),
(13, 'Tyler Rodriguez', 33, 'Male', 'tracygibson@gmail.com', 9),
(14, 'Melissa Williamson', 64, 'Male', 'sandovalthomas@pena.org', 5),
(15, 'Tina Moore', 47, 'Other', 'wendy83@harris.com', 13),
(16, 'John Garcia', 34, 'Other', 'tylerroberts@yahoo.com', 19),
(17, 'Mary Stout', 66, 'Other', 'ynixon@yahoo.com', 8),
(18, 'Travis Boyd', 55, 'Other', 'lgarcia@gmail.com', 1),
(19, 'Jamie Drake', 26, 'Other', 'ogomez@barajas-perez.com', 1),
(20, 'Dale Miller', 57, 'Other', 'wstone@reynolds-chavez.com', 17);

INSERT INTO moodlogs (mood_id, user_id, mood_rating, log_date) VALUES
(1, 4, 2, '2025-05-23'),
(2, 2, 1, '2025-06-04'),
(3, 18, 5, '2025-05-26'),
(4, 14, 4, '2025-06-02'),
(5, 13, 7, '2025-06-12'),
(6, 4, 7, '2025-06-15'),
(7, 15, 1, '2025-05-27'),
(8, 12, 1, '2025-05-30'),
(9, 14, 10, '2025-05-19'),
(10, 13, 9, '2025-06-06'),
(11, 6, 7, '2025-06-07'),
(12, 16, 7, '2025-06-02'),
(13, 11, 6, '2025-05-27'),
(14, 1, 1, '2025-06-08'),
(15, 20, 5, '2025-05-18'),
(16, 18, 10, '2025-06-05'),
(17, 8, 5, '2025-06-15'),
(18, 17, 7, '2025-05-18'),
(19, 14, 3, '2025-06-14'),
(20, 20, 3, '2025-05-23');

INSERT INTO activitylogs (activity_id, user_id, activity_type, duration_mins, calories_burned, activity_date) VALUES
(1, 7, 'Hiking', 116, 232, '2025-06-11'),
(2, 19, 'Yoga', 69, 172, '2025-05-20'),
(3, 10, 'Cycling', 24, 207, '2025-06-04'),
(4, 16, 'Cycling', 73, 453, '2025-05-23'),
(5, 11, 'Swimming', 95, 624, '2025-05-30'),
(6, 3, 'Yoga', 67, 762, '2025-06-10'),
(7, 3, 'Hiking', 107, 176, '2025-05-26'),
(8, 11, 'Boxing', 75, 795, '2025-05-24'),
(9, 3, 'Hiking', 78, 865, '2025-06-05'),
(10, 2, 'Cycling', 81, 253, '2025-05-27'),
(11, 5, 'Yoga', 32, 943, '2025-05-23'),
(12, 9, 'Yoga', 13, 578, '2025-05-26'),
(13, 10, 'Swimming', 54, 433, '2025-05-27'),
(14, 10, 'Hiking', 103, 933, '2025-05-19'),
(15, 5, 'Hiking', 49, 801, '2025-05-28'),
(16, 1, 'Hiking', 57, 196, '2025-06-03'),
(17, 13, 'Running', 79, 163, '2025-06-01'),
(18, 5, 'Boxing', 53, 317, '2025-06-04'),
(19, 16, 'Cycling', 78, 779, '2025-06-01'),
(20, 14, 'Hiking', 80, 239, '2025-06-13');

INSERT INTO dietlogs (diet_id, user_id, meal_type, food_items, calories_intake, meal_date) VALUES
(1, 2, 'Breakfast', 'guess, usually', 834, '2025-05-26'),
(2, 10, 'Snack', 'level, will, agree', 547, '2025-05-26'),
(3, 13, 'Breakfast', 'big, record, only', 1307, '2025-06-09'),
(4, 6, 'Dinner', 'style, successful, according, begin', 817, '2025-05-26'),
(5, 8, 'Lunch', 'Congress, much, federal', 1476, '2025-05-19'),
(6, 11, 'Dinner', 'trial, reason, would, often, win', 310, '2025-06-01'),
(7, 5, 'Dinner', 'role, pull, against, them', 1015, '2025-06-01'),
(8, 2, 'Lunch', 'media, development', 707, '2025-05-26'),
(9, 6, 'Lunch', 'bring, its', 247, '2025-06-08'),
(10, 5, 'Breakfast', 'take, market, health', 696, '2025-06-06'),
(11, 4, 'Snack', 'go, life', 390, '2025-05-23'),
(12, 15, 'Breakfast', 'occur, center, every', 663, '2025-05-25'),
(13, 4, 'Dinner', 'return, husband, join, baby', 1141, '2025-06-03'),
(14, 5, 'Breakfast', 'cup, religious', 1123, '2025-06-15'),
(15, 20, 'Dinner', 'foreign, be, cultural', 908, '2025-06-08'),
(16, 12, 'Dinner', 'rather, new, front, challenge', 320, '2025-05-30'),
(17, 7, 'Dinner', 'small, century, offer, southern', 936, '2025-05-28'),
(18, 13, 'Breakfast', 'career, political, employee, situation', 1456, '2025-05-23'),
(19, 1, 'Snack', 'simply, tough, onto, though, ahead', 896, '2025-06-01'),
(20, 4, 'Dinner', 'bag, paper, thank, that, society', 315, '2025-05-28');

INSERT INTO wearabledata (wearable_id, user_id, timestamp, heart_rate, steps_count, sleep_hours, device_name) VALUES
(1, 18, '2025-05-29 14:37:23', 126, 5624, 4.4, 'Garmin Venu'),
(2, 8, '2025-05-18 00:50:43', 91, 4452, 4.3, 'Samsung Galaxy Watch'),
(3, 20, '2025-06-09 11:03:38', 82, 15172, 8.9, 'Samsung Galaxy Watch'),
(4, 13, '2025-05-28 16:42:39', 85, 16111, 4.7, 'Samsung Galaxy Watch'),
(5, 13, '2025-06-09 00:30:20', 72, 9986, 3.1, 'Garmin Venu'),
(6, 16, '2025-05-25 15:30:25', 123, 14223, 8.4, 'Apple Watch'),
(7, 14, '2025-06-06 14:25:38', 96, 14447, 9.0, 'Fitbit Charge'),
(8, 16, '2025-06-11 01:15:31', 130, 11478, 7.7, 'Garmin Venu'),
(9, 12, '2025-06-03 14:18:10', 109, 7859, 6.0, 'Fitbit Charge'),
(10, 20, '2025-06-01 03:34:49', 67, 3119, 5.0, 'Garmin Venu'),
(11, 11, '2025-06-14 21:35:30', 60, 19793, 3.4, 'Huawei Band'),
(12, 4, '2025-06-12 22:36:33', 124, 4380, 5.4, 'Huawei Band'),
(13, 4, '2025-05-27 20:39:33', 72, 17815, 4.1, 'Apple Watch'),
(14, 2, '2025-05-26 00:28:52', 116, 8166, 4.8, 'Huawei Band'),
(15, 6, '2025-06-10 01:30:16', 74, 14301, 6.9, 'Garmin Venu'),
(16, 19, '2025-05-27 11:05:56', 100, 17635, 7.7, 'Huawei Band'),
(17, 5, '2025-05-18 23:08:51', 121, 4688, 6.3, 'Apple Watch'),
(18, 18, '2025-06-08 09:17:54', 104, 11844, 6.5, 'Fitbit Charge'),
(19, 8, '2025-05-29 13:59:09', 119, 4511, 4.5, 'Huawei Band'),
(20, 9, '2025-05-22 14:47:08', 97, 5942, 3.0, 'Huawei Band');


