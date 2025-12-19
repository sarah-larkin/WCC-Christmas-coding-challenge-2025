\c recipebook

-- Write a query that returns a recipe by its name with all the ingredients 
-- needed to cook that recipe.
-----------------------------------------------------------------------------

SELECT
    recipes.recipe_name,
    array_agg(ingredients.ingredient_name)
FROM recipes
JOIN recipes_ingredients ON recipes.recipe_id = recipes_ingredients.recipe_id
JOIN ingredients ON recipes_ingredients.ingredient_id = ingredients.ingredient_id
WHERE recipes.recipe_name = 'pepperoni pizza'
GROUP BY recipes.recipe_name;

-- Find all the recipes that belong to a certain course.
----------------------------------------------------------
UPDATE recipes
SET course_id = (SELECT course_id FROM courses WHERE course_name = 'main')
WHERE recipe_id IN (1, 2) ;

UPDATE recipes
SET course_id = (SELECT course_id FROM courses WHERE course_name = 'dessert')
WHERE recipe_id =3 ;

SELECT * FROM recipes;

SELECT
    courses.course_name,
    recipes.recipe_name
FROM recipes
JOIN courses ON recipes.course_id = courses.course_id
WHERE courses.course_name = 'main';


