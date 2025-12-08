\c bookshop

-- DB       = bookshop
-- tables   = books, authors, genres


-- Create a junction table 
-------------------------------

--many-to-many relationship (books and genres)

--book can have many genres and each genres could have many books 

DROP TABLE IF EXISTS books_genres;

CREATE TABLE IF NOT EXISTS books_genres(
    id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(book_id) ON DELETE CASCADE,
    genre_id INTEGER REFERENCES genres(genre_id) 
);

INSERT INTO books_genres
    (book_id, genre_id)
VALUES
(1,1),
(1,7),
(2,2),
(2,8),
(3,2),
(3,8),
(4,3),
(4,8),
(5,5),
(5,8),
(6,5),
(6,8),
(7,8),
-- (8,8),   --Deleted previously
-- (9,6),   --Deleted previously
(10,3),
(10,8);

SELECT * FROM books_genres;




