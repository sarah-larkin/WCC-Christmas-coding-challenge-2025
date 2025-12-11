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
    ROUND(AVG(r.rating),2)
FROM users u
INNER JOIN reviews r 
ON u.user_id = r.user_id
GROUP BY u.user_name;
-- HAVING u.user_name = 'Julia Bennett';



-- List books that a user has not reviewed.
-----------------------------------------------

-- -- all books a user HAS reviewed
-- SELECT
--     u.user_id,
--     u.user_name,
--     b.book_title
-- FROM books b
-- JOIN reviews r ON b.book_id = r.book_id
-- JOIN users u ON r.user_id = u.user_id;


-- try with left join tomorrow 
