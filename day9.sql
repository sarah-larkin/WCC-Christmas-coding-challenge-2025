\c bookshop

-- Query only the most favourable and unfavourable reviews for a specified book
---------------------------------------------------------------------------------

(SELECT
    books.book_title,
    reviews.rating,
    reviews.review
FROM books
JOIN reviews ON books.book_id = reviews.book_id
WHERE books.book_title LIKE 'The Handmaid''s Tale'
ORDER BY reviews.rating DESC
LIMIT 1)

UNION ALL    --combine 2 SELECT statements (keeping duplications)

(SELECT
    books.book_title,
    reviews.rating,
    reviews.review
FROM books
JOIN reviews ON books.book_id = reviews.book_id
WHERE books.book_title LIKE 'The Handmaid''s Tale'
ORDER BY reviews.rating ASC
LIMIT 1);

-- using RANK()
-- use if there is likely to be more than one top or bottom rating
-- https://www.geeksforgeeks.org/sql/rank-function-in-sql-server/

SELECT
    book_title,  --don't need table names included as taking from subquery
    rating,
    review
FROM (
    SELECT
        books.book_title,
        reviews.rating,
        reviews.review,
        RANK () OVER (ORDER BY reviews.rating DESC) AS high,
        RANK () OVER (ORDER BY reviews.rating ASC) AS low
    FROM books
    JOIN reviews ON books.book_id = reviews.book_id
    WHERE books.book_title LIKE 'The Hitch%') 

WHERE high = 1 or low = 1;





-- Query List all books above a certain average rating.
---------------------------------------------------------