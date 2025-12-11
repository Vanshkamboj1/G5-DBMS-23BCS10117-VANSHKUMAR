CREATE TABLE UserProfile (
    user_ID INT,
    Name VARCHAR(50),
    Age INT,
    Email VARCHAR(100)
);

INSERT INTO UserProfile VALUES
(1, 'Rajesh', 28, 'rajesh@gmail.com'),
(2, 'Priya', 25, 'priya@gmail.com'),
(3, 'Suresh', 30, 'rajesh@gmail.com'),
(4, 'Anjali', 24, 'priya@gmail.com');

UPDATE UserProfile
SET Email = 'duplicate email'
WHERE user_ID IN (
    SELECT MAX(user_ID)
    FROM UserProfile
    GROUP BY Email
    HAVING COUNT(*) > 1
);
