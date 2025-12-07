-- Create a new table with id and genre
----------------------------------------------------

CREATE TABLE IF NOT EXISTS genres (
    genre_id SERIAL PRIMARY KEY,
    genre VARCHAR(50)
);

-- SELECT * FROM genres;

-- add genres to the table 
-----------------------------------------------------

INSERT INTO genres(
    genre
)
VALUES
('science fiction'),
('children''s'),
('romance'),
('fantasy'),
('dystopian'),
('science'),
('adventure'),
('classic');

SELECT * FROM genres;

