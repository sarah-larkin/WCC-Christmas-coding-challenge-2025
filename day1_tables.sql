\c bookshop;
-----------------------------------
--run: psql -f 02_tables.sql 
-----------------------------------

DROP TABLE books CASCADE;

CREATE TABLE books(
    book_id SERIAL PRIMARY KEY,
    book_title TEXT NOT NULL,
    price_in_pence INT,
    quantity_in_stock INT,
    release_date DATE,
    is_fiction BOOLEAN
);

-- SELECT * FROM books;

INSERT INTO books(
    book_title,
    price_in_pence,
    quantity_in_stock, 
    release_date ,
    is_fiction
)
VALUES 
('The Hitchhiker''s Guide to the Galaxy', 899, 560, '1997-10-12', true), 
('The Little Prince', 699, 1020, '1943-04-06', true),
('The Tale of Peter Rabbit', 599, 1000, '1902-10-01', true),
('Emma',522,390,'1815-12-23',true),
('Nineteen Eighty-Four: A Novel',799,420,'1949-06-08',true),
('The Handmaid''s Tale',899,10,'1985-08-01',true),
('The War of the Worlds',250,17,'1897-04-01',true),
('Captain Corelli''s Mandolin',999,0,'1995-08-29',true),
('A Brief History of Time',825,0,'1988-04-01',false),
('Pride and Prejudice',699,4,'1813-01-28',true);

-- SELECT * FROM books;

------------------------------------------------------------------
-- QUERY
------------------------------------------------------------------

-- -- Write a query to list each of the following:
-- --------------------------------------------------

-- -- The books that we have in stock
-- SELECT * FROM books
-- WHERE quantity_in_stock > 0;

-- -- The non-fiction books
-- SELECT * FROM books
-- WHERE is_fiction = false; 

-- -- The books released in the 1900s
-- SELECT * FROM books
-- WHERE release_date BETWEEN '1900-01-01' AND '1999-12-31';    --inclusive - use correct date format in quotes

-- -- The books with "the" in the title
-- SELECT * FROM books
-- WHERE book_title LIKE 'The%';

-- -- All of the books sorted in alphabetical order
-- SELECT * FROM books
-- ORDER BY book_title ASC;

-- -- The most expensive book
-- SELECT * FROM books
-- ORDER BY price_in_pence DESC
-- LIMIT

