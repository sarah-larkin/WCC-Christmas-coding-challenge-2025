\c bookshop

-- DB       = bookshop
-- tables   = books, authors


-- Update each book with the id of its author 
-------------------------------------------------

-- SELECT * FROM books;
-- SELECT * FROM authors;
-- use \q to escape the terminal if needed

--answers: 

UPDATE books
SET author_id = 3
WHERE book_title LIKE '%Hitchhiker%';

--use subquery: 

UPDATE books
SET author_id = (SELECT author_id FROM authors WHERE author_name = 'Antoine de Saint-Exupéry')
WHERE book_title = 'The Little Prince';

UPDATE books
SET author_id = (SELECT author_id FROM authors WHERE author_name = 'Beatrix Potter')
WHERE book_title = 'The Tale of Peter Rabbit';

-- UPDATE books
-- SET author_id = (SELECT author_id FROM authors WHERE author_name = 'Jane Austen')
-- WHERE book_title = 'Emma';

UPDATE books
SET author_id = (SELECT author_id FROM authors WHERE author_name = 'George Orwell')
WHERE book_title LIKE 'Nineteen Eighty-Four%';

UPDATE books
SET author_id = (SELECT author_id FROM authors WHERE author_name = 'Margaret Atwood')
WHERE book_title = 'The Handmaid''s Tale';  -- double '' for apostrophe 

UPDATE books
SET author_id = (SELECT author_id FROM authors WHERE author_name = 'H. G. Wells')
WHERE book_title = 'The War of the Worlds';

UPDATE books
SET author_id = (SELECT author_id FROM authors WHERE author_name = 'Jane Austen')
WHERE book_title IN ('Pride and Prejudice', 'Emma'); -- use IN for multple options

SELECT * FROM books
ORDER BY book_id;