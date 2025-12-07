\c bookshop

-- DB       = bookshop
-- tables   = books, authors

-- Get a list of book titles and corresponding authors. 
------------------------------------------------------------------------

SELECT 
    books.book_title,
    authors.author_name
FROM
    books
LEFT JOIN authors ON books.author_id = authors.author_id; 

-- Query the table to see which authors don't have an associated book.  
------------------------------------------------------------------------

SELECT
    authors.author_name
FROM
    authors
LEFT JOIN books ON authors.author_id = books.author_id
--WHERE books.book_title IS NULL;
WHERE books.author_id IS NULL;

