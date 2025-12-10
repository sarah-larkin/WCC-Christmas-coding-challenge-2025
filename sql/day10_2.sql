\c bookshop

--create users table
-------------------------

DROP TABLE IF EXISTS users;

CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(50)
);

INSERT INTO users 
    (user_name)
VALUES
    ('Alice Johnson'),
    ('Benjamin Carter'),
    ('Clara Nguyen'),
    ('David Thompson'),
    ('Elena Rodriguez'),
    ('Felix Morgan'),
    ('Grace Patel'),
    ('Hannah Kim'),
    ('Isaac Walker'),
    ('Julia Bennett');

SELECT * FROM users;


-- link users to reviews 
--------------------------

--add column
ALTER TABLE reviews
    ADD COLUMN IF NOT EXISTS user_id INT;

--keep fk contraint working when re-run
ALTER TABLe reviews
    DROP CONSTRAINT IF EXISTS fk_user_id;

--fk contraint
ALTER TABLE reviews
    ADD CONSTRAINT fk_user_id
    FOREIGN KEY (user_id) REFERENCES users (user_id)
    ON DELETE CASCADE; 

--populate values
UPDATE reviews
SET user_id = (SELECT user_id FROM users WHERE user_name = 'Alice Johnson')
WHERE review_id IN (2,3,7,8,18);

UPDATE reviews
SET user_id = (SELECT user_id FROM users WHERE user_name = 'David Thompson')
WHERE review_id IN (1,11,16);

UPDATE reviews
SET user_id = (SELECT user_id FROM users WHERE user_name = 'Isaac Walker')
WHERE review_id IN (4,9,12);

UPDATE reviews
SET user_id = (SELECT user_id FROM users WHERE user_name = 'Felix Morgan')
WHERE review_id IN (5);

UPDATE reviews
SET user_id = (SELECT user_id FROM users WHERE user_name = 'Hannah Kim')
WHERE review_id IN (6);

UPDATE reviews
SET user_id = (SELECT user_id FROM users WHERE user_name = 'Grace Patel')
WHERE review_id IN (10, 17);

UPDATE reviews
SET user_id = (SELECT user_id FROM users WHERE user_name = 'Benjamin Carter')
WHERE review_id IN (13, 15);

UPDATE reviews
SET user_id = (SELECT user_id FROM users WHERE user_name = 'Julia Bennett')
WHERE review_id IN (14);

SELECT * FROM reviews;

-- alternative

-- UPDATE reviews r
-- SET user_id = u.user_id
-- FROM (
--     VALUES
--         ('Alice Johnson', ARRAY[2,3,7,8,18]),
--         ('David Thompson', ARRAY[1,11,16]),
--         ('Isaac Walker', ARRAY[4,9,12]),
--         ('Felix Morgan', ARRAY[5]),
--         ('Hannah Kim', ARRAY[6]),
--         ('Grace Patel', ARRAY[10,17]),
--         ('Benjamin Carter', ARRAY[13,15]),
--         ('Julia Bennett', ARRAY[14])
-- ) AS v(user_name, review_ids)
-- JOIN users u ON u.user_name = v.user_name
-- WHERE r.review_id = ANY(v.review_ids);

