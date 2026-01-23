\c recipebook

-- Find all the recipes that use all of a certain set of ingredients.
--------------------------------------------------------------------------------

SELECT recipes.recipe_name
FROM recipes 
JOIN recipes_ingredients ON recipes.recipe_id = recipes_ingredients.recipe_id
JOIN ingredients ON recipes_ingredients.ingredient_id = ingredients.ingredient_id
WHERE ingredients.ingredient_id IN (11,15)
GROUP BY recipes.recipe_id--, recipes.recipe_name
HAVING COUNT(DISTINCT recipes_ingredients.ingredient_id) = 2;




-- Find all the recipes which use one or more of a certain set of ingredients.
-------------------------------------------------------------------------------------

SELECT recipes.recipe_name
FROM recipes 
JOIN recipes_ingredients ON recipes.recipe_id = recipes_ingredients.recipe_id
JOIN ingredients ON recipes_ingredients.ingredient_id = ingredients.ingredient_id
WHERE ingredients.ingredient_id IN (11,15)
GROUP BY recipes.recipe_name;


-- more advanced filtering: 
-- Find all the pizzas that include garlic or tomatoes but not mushrooms.
----------------------------------------------------------------------------------------

-- Ingredient ids: 
-- garlic   - 19
-- tomato   - 1
-- mushroom - 18

-- need to filter at recipe level not row level!! 

SELECT 
    recipes.recipe_name,
    ARRAY_AGG(ingredients.ingredient_name)
FROM recipes 
JOIN recipes_ingredients ON recipes.recipe_id = recipes_ingredients.recipe_id
JOIN ingredients ON recipes_ingredients.ingredient_id = ingredients.ingredient_id
WHERE recipes.category_id = 2 --pizza
GROUP BY recipes.recipe_name
HAVING 
--filter by the number of times the ingredients appear, not by the indgredients themselves
--if you filter by ingredients, all other ingredients get filtered out so mushroom can never exist
    SUM(CASE WHEN ingredients.ingredient_id IN (1,19) THEN 1 ELSE 0 END) > 0 --having SUM(condition > 1) ie. one is present 
AND SUM(CASE WHEN ingredients.ingredient_id IN (18) THEN 1 ELSE 0 END) = 0; -- having SUM(condition = 0) ie not present
-- CASE like if-elif-else in python


-- CHECK: 
--      HAVING / EXISTS --> SQL HAVING conditional aggregation
--      Why NOT IN doesn't work here 
--      typical EXCEPT use cases 
--      set based SQL / declarative SQL 



-- add new table "methods" (without dropping the db)
-- adjust the current tables (preserve original data)
-- ingredients can be cooked using a variety of methods depending on the dish
-- each method can be used on any number of ingredients
----------------------------------------------------------------------------------------

DROP TABLE IF EXISTS methods;

CREATE TABLE if NOT EXISTS methods(
    method_id SERIAL PRIMARY KEY,
    method_name VARCHAR(50)
);

\echo "methods table"
INSERT INTO methods
    (method_name)
VALUES
    ('fry'),
    ('boil'),
    ('roast'),
    ('bake'),
    ('poach'),
    ('whisk'),
    ('mix'),
    ('chop'),
    ('slice'),
    ('melt'),
    ('grate'),
    ('season'),
    ('blend'),
    ('break apart / sprinkle');

--view relevant tables 
SELECT * FROM methods;

SELECT * FROM ingredients
ORDER BY ingredient_id;

SELECT * FROM recipes
ORDER BY recipe_id;

-- add column: 
ALTER TABLE IF EXISTS recipes_ingredients
    ADD COLUMN IF NOT EXISTS method_id INT;

-- updated column values: 
UPDATE recipes_ingredients
SET method_id = 2 -- boil
WHERE recipe_ingredient_id IN (1,2,3); -- ministroni soup recipe_ingredient_id

UPDATE recipes_ingredients
SET method_id = 7 -- mix
WHERE ingredient_id IN (3, 11) -- flour, water
    AND recipe_id IN (SELECT recipes.recipe_id FROM recipes WHERE recipe_name LIKE '%pizza%');

UPDATE recipes_ingredients
SET method_id = 12 -- season
WHERE ingredient_id = 13; -- salt

UPDATE recipes_ingredients
SET method_id = 8 -- chop
WHERE ingredient_id IN (1, 21, 19) -- tomato, ham, garlic
    AND recipe_id IN (SELECT recipes.recipe_id FROM recipes WHERE recipe_name LIKE '%pizza%');

UPDATE recipes_ingredients
SET method_id =  9 -- slice
WHERE ingredient_id IN (5, 16, 18, 22, 24) -- mozzarella, pepperoni, mushroom, gorgonzola cheese, fontina cheese
    AND recipe_id IN (SELECT recipes.recipe_id FROM recipes WHERE recipe_name LIKE '%pizza%');

UPDATE recipes_ingredients
SET method_id = 6 -- whisk
WHERE ingredient_id IN (8, 17) -- cream, sugar 
    AND recipe_id IN (SELECT recipes.recipe_id FROM recipes WHERE recipe_name LIKE '%gelato%');

UPDATE recipes_ingredients
SET method_id = 13 -- blend
WHERE ingredient_id IN (10) -- pistachio
    AND recipe_id IN (SELECT recipes.recipe_id FROM recipes WHERE recipe_name LIKE '%gelato%');

UPDATE recipes_ingredients
SET method_id = 14 -- break apart/sprinkle
WHERE ingredient_id IN (2, 6, 7) -- basil, tuna, chicken(assumed cooked)
    AND recipe_id IN (SELECT recipes.recipe_id FROM recipes WHERE recipe_name LIKE '%pizza%');

UPDATE recipes_ingredients
SET method_id = 11 -- grate
WHERE ingredient_id = 23; -- parmesan cheese

-- alternative
---------------

-- UPDATE recipes_ingredients  -- table to update 
-- SET 
--     method_id = 
--                 CASE 
--                     WHEN r.recipe_name LIKE '%pizza%' 
--                     AND i.ingredient_name IN ('flour', 'water')
--                     THEN 7
--                     END
-- -- where you get all the input data from (run first): 
-- FROM recipes r -- FROM and WHERE joins recipes to recipes_ingredients
-- JOIN recipes_ingredients ri ON r.recipe_id = ri.recipe_id -- joining ri junction table (same as table being updated)
-- JOIN ingredients i ON ri.ingredient_id = i.ingredient_id -- joining ingredients
-- -- every row will be updated with either 1) the output a the CASE statement or 2) null 
-- -- based on the recipe_ingredient_id matching in the table being updated and the joined reference tables 
-- -- where table to update unique id = joined tables you are getting data from unique id (match on every row) 
-- WHERE recipes_ingredients.recipe_ingredient_id = ri.recipe_ingredient_id;

-- UPDATE recipes_ingredients ri -- can only reference this table in (SET or) WHERE clause (not JOIN)
-- SET method_id = 
--                 CASE
--                     WHEN r.recipe_name LIKE '%pizza%'
--                     AND i.ingredient_name IN ('flour', 'water')
--                     THEN 7
--                     ELSE ri.method_id --keeps previous input rather than overwriting with null
--                 END               
-- FROM recipes r
-- JOIN ingredients i ON TRUE -- check this further 
-- WHERE ri.recipe_id = r.recipe_id
--  AND ri.ingredient_id = i.ingredient_id;


SELECT * FROM recipes_ingredients
ORDER BY recipe_ingredient_id;




-- check 
-- set based updates, 
-- data/driven design/(lookup/mapping) tables instead of UPDATE



-- queries: 
-- Find all of the methods used in starters.
-- Find all of the ingredients that use a specific method.
-- Find all of the ingredients that use more than 2 methods.
-- Find all of the ingredients for a specific recipe and the relevant methods used for those ingredients
