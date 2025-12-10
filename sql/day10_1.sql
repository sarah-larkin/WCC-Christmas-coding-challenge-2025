\c bookshop

-- Query: List all books above a certain average rating.
---------------------------------------------------------

SELECT
    book_title,
    average_rating
FROM (
    --average rating
    SELECT
        books.book_title,
        ROUND(AVG(reviews.rating),2) AS average_rating
    FROM books
    JOIN reviews ON books.book_id = reviews.book_id
    GROUP BY books.book_title)
WHERE average_rating > 5;

