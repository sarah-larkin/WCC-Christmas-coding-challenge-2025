\c bookshop

----------------------------------
-- psql -f day2.sql 
----------------------------------


-- -- Delete book that are not in stock 
-------------------------------------------
-- SELECT * FROM books;

-- SELECT * FROM books
-- WHERE quantity_in_stock = 0;

DELETE FROM books
WHERE quantity_in_stock = 0
RETURNING *;                -- will list the deleted items

-- SELECT * FROM books;


-- -- Apply a 10% discount for any books where there are more than 10 in stock 
-- ----------------------------------------------------------------------------
-- SELECT * FROM books
-- WHERE quantity_in_stock > 10;


UPDATE books
SET price_in_pence = price_in_pence * 0.9
WHERE quantity_in_stock > 10; 

SELECT * FROM books
ORDER BY book_id ASC;


