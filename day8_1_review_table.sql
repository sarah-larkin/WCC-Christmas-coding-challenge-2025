\c bookshop


-- Add the ability to add reviews to the books.
-------------------------------------------------

-- review_id 
-- rating
-- review 
-- book_id - FK 

DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    rating INT,
    review TEXT,
    book_id INT REFERENCES books(book_id) 
);

INSERT INTO reviews
    (rating, review, book_id)
VALUES
    (10, 'Best book ever', 1),
    (5, 'Distinctly average', 1),
    (2, 'Bit boring', 1),
    (4, 'ok', 2),
    (7, 'beautiful read', 2),
    (4, 'difficult read', 5),
    (10, 'blew my mind', 5),
    (8, 'great concept, slow read', 5),
    (10, 'must read', 6),
    (3, 'unrealistic', 6),
    (6, 'interesting concept, but not enjoyable', 6),
    (9, 'scary one', 6),
    (2, 'too long', 7),
    (8, 'great read', 7),
    (2, 'slow and boring', 10),
    (10, 'timeless classic', 10),
    (8, 'heartwarming romance', 10),
    (4, 'slow', 10);


SELECT * FROM reviews; 
