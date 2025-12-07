\c bookshop

-- -- Alter books table to link the book to it's author --> FK 
-- -------------------------------------------------------------
-- -- https://blog.devart.com/postgresql-foreign-key.html#Add-Foreign-Key-to-an-existing-table

ALTER TABLE books
    ADD COLUMN IF NOT EXISTS author_id INT;  --must specify data type 

ALTER TABLE books
    ADD CONSTRAINT fk_author_id
    FOREIGN KEY (author_id) REFERENCES authors (author_id)
    ON DELETE CASCADE; -- added day7

SELECT * FROM books;