\c bookshop

-- List books that a user has not reviewed.
-----------------------------------------------

-- -- all books a user HAS reviewed
-- SELECT
--     --u.user_id,
--     u.user_name,
--     b.book_title
-- FROM books b
-- JOIN reviews r ON b.book_id = r.book_id
-- JOIN users u ON r.user_id = u.user_id;


-- all books a user HAS NOT reviewed - LEFT JOIN
-- return book_titles from books 
-- need review info from reviews table 
-- where review is null 

SELECT
    b.book_title
FROM books b
LEFT JOIN reviews r 
    ON b.book_id = r.book_id  --show all 7 books due to LEFT JOIN
    AND r.user_id = 4         --add condition filter but keep non matches 
WHERE r.review_id IS NULL;    -- return only non matches 
