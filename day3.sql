\c bookshop

-- DB       = bookshop
-- tables   = books, authors


-- Update each book with the id of its author 
-------------------------------------------------

-- SELECT * FROM books;
-- SELECT * FROM authors;
-- use \q to escape the terminal if needed

UPDATE books
SET author_id = 3
WHERE book_title LIKE %Hitchhiker%;

SELECT * FROM books;