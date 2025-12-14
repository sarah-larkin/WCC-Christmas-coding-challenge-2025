\c bookshop

-- DB       = bookshop
-- tables   = books, authors, genres, books_genres

-- List all genres that a certain book belongs to
-----------------------------------------------------

SELECT 
    books.book_title,
    genres.genre
FROM books_genres
JOIN books ON books_genres.book_id = books.book_id
JOIN genres ON books_genres.genre_id = genres.genre_id
WHERE books.book_title LIKE 'The Little Prince';


-- List all books belonging to a certain genre
-----------------------------------------------------
SELECT
    genres.genre,
    books.book_title
FROM books_genres
JOIN genres ON books_genres.genre_id = genres.genre_id
JOIN books ON books_genres.book_id = books.book_id
WHERE genres.genre LIKE 'children''s';


-- List the total number of books we have by each author 
----------------------------------------------------------

SELECT
    authors.author_name,
    COUNT(books.book_id) AS total_books
FROM authors
JOIN books ON authors.author_id = books.author_id
GROUP BY authors.author_name;

--JOIN (INNER JOIN) - only matching 
--LEFT JOIN - Includes all authors


-- List the average price for books of a specific genre
------------------------------------------------------------

SELECT
    genres.genre,
    AVG(books.price_in_pence) AS Average_price
FROM genres
JOIN books_genres ON genres.genre_id = books_genres.genre_id
JOIN books ON books_genres.book_id = books.book_id
GROUP BY genres.genre
HAVING genres.genre LIKE 'dystopian';