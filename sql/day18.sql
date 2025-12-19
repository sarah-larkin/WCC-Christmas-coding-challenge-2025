-- run with psql -f sql/day18.sql > sql/day18.txt

DROP DATABASE recipebook;

CREATE DATABASE recipebook;

\c recipebook

DROP TABLE IF EXISTS courses;
CREATE TABLE IF NOT EXISTS courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50)
);

DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories(
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50)
);

DROP TABLE IF EXISTS ingredients;
CREATE TABLE IF NOT EXISTS ingredients(
    ingredient_id SERIAL PRIMARY KEY,
    ingredient_name VARCHAR(100)
);

DROP TABLE IF EXISTS recipes;
CREATE TABLE IF NOT EXISTS recipes(
    recipe_id SERIAL PRIMARY KEY,
    recipe_name VARCHAR(50),
    course_id INT REFERENCES courses(course_id),
    category_id INT REFERENCES categories(category_id)    
);

DROP TABLE IF EXISTS recipes_ingredients;
CREATE TABLE IF NOT EXISTS recipes_ingredients(
    recipe_ingredient_id SERIAL PRIMARY KEY,
    recipe_id INT REFERENCES recipes(recipe_id),
    ingredient_id INT REFERENCES ingredients(ingredient_id)
);

\echo "Courses table"
INSERT INTO courses(
    course_name
)
VALUES
    ('starter'),
    ('main'),
    ('dessert'), 
    ('sides'),
    ('drinks');

SELECT * FROM courses;

\echo "Categories table"
INSERT INTO categories(
    category_name
)
VALUES
    ('fish'),
    ('pizza'),
    ('pasta'),
    ('meat'),
    ('soup'),
    ('sweet');

SELECT * FROM categories;

\echo "Ingredients table"
INSERT INTO ingredients(
    ingredient_name
)
VALUES
    ('tomato'),
    ('basil'),
    ('flour'),
    ('egg'),
    ('mozzarella'),
    ('tuna'),
    ('chicken'),
    ('cream'),
    ('chocolate'),
    ('pistachio'),
    ('water'),
    ('semolina'),
    ('salt'),
    ('olive oil'),
    ('minestrone'),
    ('pepperoni'),
    ('sugar');

SELECT * FROM ingredients;

\echo "Recipes table"
INSERT INTO recipes(
    recipe_name
)
VALUES
    ('minestrone soup'),
    ('pepperoni pizza'),
    ('pistachio gelato');

SELECT * FROM recipes;

\echo "recipes_ingredients table"
INSERT INTO recipes_ingredients(
    recipe_id, ingredient_id
)
VALUES
    (1, 15),
    (1, 11),
    (1, 7),
    (1, 13),
    (2, 3),
    (2, 11),
    (2, 1),
    (2, 16),
    (2, 5),
    (3, 10),
    (3, 8),
    (3, 17);

SELECT * FROM recipes_ingredients;

-- add course_id and category_id to recipes table