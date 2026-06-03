

CREATE DATABASE CommunityEventDB;
USE CommunityEventDB;



CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);

CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    city VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status ENUM('upcoming','completed','cancelled'),
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Users(user_id)
);

CREATE TABLE Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    title VARCHAR(200) NOT NULL,
    speaker_name VARCHAR(100) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    registration_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE Resources (
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    resource_type ENUM('pdf','image','link'),
    resource_url VARCHAR(255),
    uploaded_at DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);



INSERT INTO Users VALUES
(1,'Alice Johnson','alice@example.com','New York','2024-12-01'),
(2,'Bob Smith','bob@example.com','Los Angeles','2024-12-05'),
(3,'Charlie Lee','charlie@example.com','Chicago','2024-12-10'),
(4,'Diana King','diana@example.com','New York','2025-01-15'),
(5,'Ethan Hunt','ethan@example.com','Los Angeles','2025-02-01');

INSERT INTO Events VALUES
(1,'Tech Meetup','Tech event','New York','2025-06-10 10:00:00','2025-06-10 16:00:00','upcoming',1),
(2,'AI Conference','AI event','Chicago','2025-05-15 09:00:00','2025-05-15 17:00:00','completed',3),
(3,'Frontend Bootcamp','Frontend training','Los Angeles','2025-07-01 10:00:00','2025-07-03 16:00:00','upcoming',2);

INSERT INTO Sessions VALUES
(1,1,'Opening Keynote','Dr. Tech','2025-06-10 10:00:00','2025-06-10 11:00:00'),
(2,1,'Future of Web Dev','Alice Johnson','2025-06-10 11:15:00','2025-06-10 12:30:00'),
(3,2,'AI in Healthcare','Charlie Lee','2025-05-15 09:30:00','2025-05-15 11:00:00'),
(4,3,'Intro to HTML5','Bob Smith','2025-07-01 10:00:00','2025-07-01 12:00:00');

INSERT INTO Registrations VALUES
(1,1,1,'2025-05-01'),
(2,2,1,'2025-05-02'),
(3,3,2,'2025-04-30'),
(4,4,2,'2025-04-28'),
(5,5,3,'2025-06-15');

INSERT INTO Feedback VALUES
(1,3,2,4,'Great insights','2025-05-16'),
(2,4,2,5,'Very informative','2025-05-16'),
(3,2,1,3,'Could be better','2025-06-11');

INSERT INTO Resources VALUES
(1,1,'pdf','https://portal.com/agenda.pdf','2025-05-01 10:00:00'),
(2,2,'image','https://portal.com/poster.jpg','2025-04-20 09:00:00'),
(3,3,'link','https://portal.com/html5','2025-06-25 15:00:00');


/* =========================
   25 SQL EXERCISES
========================= */

-- 1. User Upcoming Events
SELECT u.full_name, e.title, e.city, e.start_date
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
JOIN Events e ON r.event_id = e.event_id
WHERE e.status='upcoming' AND u.city=e.city;

-- 2. Top Rated Events
SELECT e.title, AVG(f.rating) AS avg_rating
FROM Events e
JOIN Feedback f ON e.event_id=f.event_id
GROUP BY e.event_id
HAVING COUNT(f.feedback_id) >= 10;

-- 3. Inactive Users
SELECT * FROM Users
WHERE user_id NOT IN (
    SELECT user_id FROM Registrations
    WHERE registration_date >= CURDATE() - INTERVAL 90 DAY
);

-- 4. Peak Session Hours
SELECT event_id, COUNT(*) AS sessions_count
FROM Sessions
WHERE TIME(start_time) BETWEEN '10:00:00' AND '12:00:00'
GROUP BY event_id;

-- 5. Most Active Cities
SELECT u.city, COUNT(*) AS total
FROM Users u
JOIN Registrations r ON u.user_id=r.user_id
GROUP BY u.city
ORDER BY total DESC
LIMIT 5;

-- 6. Event Resource Summary
SELECT e.title,
COUNT(CASE WHEN r.resource_type='pdf' THEN 1 END) pdfs,
COUNT(CASE WHEN r.resource_type='image' THEN 1 END) images,
COUNT(CASE WHEN r.resource_type='link' THEN 1 END) links
FROM Events e
LEFT JOIN Resources r ON e.event_id=r.event_id
GROUP BY e.event_id;

-- 7. Low Feedback Alerts
SELECT u.full_name, e.title, f.rating, f.comments
FROM Feedback f
JOIN Users u ON f.user_id=u.user_id
JOIN Events e ON f.event_id=e.event_id
WHERE f.rating < 3;

-- 8. Sessions per Upcoming Event
SELECT e.title, COUNT(s.session_id)
FROM Events e
LEFT JOIN Sessions s ON e.event_id=s.event_id
WHERE e.status='upcoming'
GROUP BY e.event_id;

-- 9. Organizer Event Summary
SELECT u.full_name, e.status, COUNT(*) total_events
FROM Events e
JOIN Users u ON e.organizer_id=u.user_id
GROUP BY u.full_name, e.status;

-- 10. Feedback Gap
SELECT e.title
FROM Events e
JOIN Registrations r ON e.event_id=r.event_id
LEFT JOIN Feedback f ON e.event_id=f.event_id
WHERE f.feedback_id IS NULL;

-- 11. Daily New Users
SELECT registration_date, COUNT(*) total
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date;

-- 12. Event with Max Sessions
SELECT e.title, COUNT(s.session_id)
FROM Events e
JOIN Sessions s ON e.event_id=s.event_id
GROUP BY e.event_id
ORDER BY COUNT(s.session_id) DESC
LIMIT 1;

-- 13. Avg Rating per City
SELECT e.city, AVG(f.rating)
FROM Events e
JOIN Feedback f ON e.event_id=f.event_id
GROUP BY e.city;

-- 14. Most Registered Events
SELECT e.title, COUNT(r.registration_id) total
FROM Events e
JOIN Registrations r ON e.event_id=r.event_id
GROUP BY e.event_id
ORDER BY total DESC
LIMIT 3;

-- 15. Session Conflicts
SELECT s1.event_id, s1.title, s2.title
FROM Sessions s1
JOIN Sessions s2
ON s1.event_id=s2.event_id
AND s1.session_id < s2.session_id
AND s1.start_time < s2.end_time
AND s1.end_time > s2.start_time;

-- 16. Unregistered Active Users
SELECT * FROM Users u
WHERE u.registration_date >= CURDATE() - INTERVAL 30 DAY
AND u.user_id NOT IN (SELECT user_id FROM Registrations);

-- 17. Multi-Session Speakers
SELECT speaker_name, COUNT(*)
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(*) > 1;

-- 18. No Resources
SELECT e.title
FROM Events e
LEFT JOIN Resources r ON e.event_id=r.event_id
WHERE r.resource_id IS NULL;

-- 19. Completed Events Summary
SELECT e.title,
COUNT(r.registration_id),
AVG(f.rating)
FROM Events e
LEFT JOIN Registrations r ON e.event_id=r.event_id
LEFT JOIN Feedback f ON e.event_id=f.event_id
WHERE e.status='completed'
GROUP BY e.event_id;

-- 20. User Engagement Index
SELECT u.full_name,
COUNT(DISTINCT r.event_id),
COUNT(DISTINCT f.feedback_id)
FROM Users u
LEFT JOIN Registrations r ON u.user_id=r.user_id
LEFT JOIN Feedback f ON u.user_id=f.user_id
GROUP BY u.user_id;

-- 21. Top Feedback Providers
SELECT u.full_name, COUNT(f.feedback_id)
FROM Users u
JOIN Feedback f ON u.user_id=f.user_id
GROUP BY u.user_id
ORDER BY COUNT(f.feedback_id) DESC
LIMIT 5;

-- 22. Duplicate Registrations
SELECT user_id, event_id, COUNT(*)
FROM Registrations
GROUP BY user_id, event_id
HAVING COUNT(*) > 1;

-- 23. Monthly Trends
SELECT DATE_FORMAT(registration_date,'%Y-%m') month, COUNT(*)
FROM Registrations
GROUP BY month;

-- 24. Avg Session Duration
SELECT e.title,
AVG(TIMESTAMPDIFF(MINUTE, s.start_time, s.end_time))
FROM Events e
JOIN Sessions s ON e.event_id=s.event_id
GROUP BY e.event_id;

-- 25. Events Without Sessions
SELECT e.title
FROM Events e
LEFT JOIN Sessions s ON e.event_id=s.event_id
WHERE s.session_id IS NULL;