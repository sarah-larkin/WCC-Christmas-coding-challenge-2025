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
    ('grate');

SELECT * FROM methods;

SELECT * FROM ingredients
ORDER BY ingredient_id;

ALTER TABLE IF EXISTS recipes_ingredients
    ADD COLUMN IF NOT EXISTS method_id INT;
-- continue here add values into method_id
SELECT * FROM recipes_ingredients;




-- queries: 
-- Find all of the methods used in starters.
-- Find all of the ingredients that use a specific method.
-- Find all of the ingredients that use more than 2 methods.
-- Find all of the ingredients for a specific recipe and the relevant methods used for those ingredients
