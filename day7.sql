\c bookshop

-- DB       = bookshop
-- tables   = books, authors, genres, books_genres

-- Handle the deletion of an author. 
-- When they are deleted, all of their books should get deleted too. 
---------------------------------------------------------------------

-- -- updated books table from day2_3_alter_books --> on delete cascade 

-- -- author_id 7 --> Beatrix Potter
-- -- book_id 3 --> The Tale of Peter Rabbit 


-- DELETE FROM authors
-- WHERE author_name LIKE 'Beatrix Potter'
-- RETURNING *; 

SELECT * FROM books;


-- Use the ARRAY_AGG() function to get a list of each book in a single row, 
-- with all genres that the book belongs to.
------------------------------------------------------------------------------

-- books.book_title
-- genres.genre 

SELECT
    books.book_title,
    ARRAY_AGG(genres.genre) AS genres
FROM books
JOIN books_genres ON books.book_id = books_genres.book_id
JOIN genres ON books_genres.genre_id = genres.genre_id
GROUP BY book_title 