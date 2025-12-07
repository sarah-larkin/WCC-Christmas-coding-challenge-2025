\c bookshop

-- DB       = bookshop
-- tables   = books, authors, genres, books_genres

-- List the average price for books of a specific genre. 
---------------------------------------------------------

-- average price of XX genre

SELECT
    genres.genre,
    AVG(books.price_in_pence) AS average_price
FROM genres
LEFT JOIN books_genres ON genres.genre_id = books_genres.genre_id
LEFT JOIN books ON books_genres.book_id = books.book_id
GROUP BY genres.genre
HAVING genres.genre LIKE 'children''s';

-- Handle the deletion of a book. When it is deleted, 
-- all of the associated records in the books_genres table should get deleted too.
------------------------------------------------------------------------------------

--update books_genres table from day5_table.sql --> on delete cascade

DELETE FROM books
WHERE book_title = 'Emma'
RETURNING *;

