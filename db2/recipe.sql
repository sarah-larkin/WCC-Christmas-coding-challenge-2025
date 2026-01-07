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

SELECT 
    recipes.recipe_name,
    ARRAY_AGG(ingredients.ingredient_name) AS ingredients
FROM recipes
JOIN recipes_ingredients ON recipes.recipe_id = recipes_ingredients.recipe_id
JOIN ingredients ON recipes_ingredients.ingredient_id = ingredients.ingredient_id
WHERE recipes.category_id = 2 
GROUP BY recipes.recipe_name;

-- NEXT: add the filtering 
-- CHECK: HAVING / EXISTS??? 



-- add new table "methods" (without dropping the db)
-- adjust the current tables (preserve original data)
----------------------------------------------------------------------------------------






-- queries: 
-- Find all of the methods used in starters.
-- Find all of the ingredients that use a specific method.
-- Find all of the ingredients that use more than 2 methods.
-- Find all of the ingredients for a specific recipe and the relevant methods used for those ingredients
