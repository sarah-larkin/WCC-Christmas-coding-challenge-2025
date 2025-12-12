\c bookshop

-- List all reviews by a single user.
-----------------------------------------

-- SELECT
--     users.user_name,
--     reviews.review
-- FROM users
-- JOIN reviews on users.user_id = reviews.user_id
-- WHERE users.user_name = 'Alice Johnson';

-- SELECT
--     u.user_name,
--     r.review
-- FROM users u
-- JOIN reviews r ON u.user_id = r.user_id
-- WHERE u.user_name = 'Alice Johnson';

SELECT
    u.user_name,
    ARRAY_AGG(r.review) AS all_reviews
FROM users u
JOIN reviews r ON u.user_id = r.user_id
GROUP BY u.user_name;
--HAVING u.user_name = 'Alice Johnson';


-- Find out the average rating that a user has given in all of their reviews.
-------------------------------------------------------------------------------

SELECT
    u.user_name,
    ROUND(AVG(r.rating),2) AS average_rating
FROM users u
INNER JOIN reviews r 
ON u.user_id = r.user_id
GROUP BY u.user_name;
-- HAVING u.user_name = 'Julia Bennett';



