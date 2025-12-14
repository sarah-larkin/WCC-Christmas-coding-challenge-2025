\c bookshop

-- DB       = bookshop
-- tables   = books, authors, genres, books_genres, reviews 

-- Query All reviews of a specified book.
--------------------------------------------- 

-- -- in one row: 
-- SELECT
--     books.book_title,
--     ARRAY_AGG(reviews.review) AS all_reviews
-- FROM books 
-- JOIN reviews on books.book_id = reviews.book_id
-- GROUP BY books.book_title
-- HAVING books.book_title LIKE 'Pride and Prejudice';

-- --multiple rows: 
-- SELECT
--     books.book_title,
--     reviews.review
-- FROM books 
-- JOIN reviews on books.book_id = reviews.book_id
-- WHERE books.book_title LIKE 'Pride and Prejudice';

-- --just list of reivews
-- \echo '\n Here are all the reviews for Pride and Prejudice:\n'
-- SELECT
--     --books.book_title,
--     reviews.review
-- FROM books 
-- JOIN reviews on books.book_id = reviews.book_id
-- WHERE books.book_title LIKE 'Pride and Prejudice';



-- Query The average rating of a book
-------------------------------------- 

SELECT
    books.book_title,
    ROUND(AVG(reviews.rating),2) AS average_rating
FROM books
JOIN reviews ON books.book_id = reviews.book_id
GROUP BY books.book_title
--HAVING books.book_title LIKE 'The Little Prince';
--HAVING books.book_title LIKE 'Nineteen Eighty-Four: A Novel';
HAVING books.book_title LIKE 'Pride and Prejudice';

