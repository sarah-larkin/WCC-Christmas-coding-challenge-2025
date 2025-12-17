\c bookshop 

-- list fun facts about authors with a revenue of more than £600.
------------------------------------------------------------------

SELECT
    authors.author_name,
    authors.fun_fact,
    agents.author_revenue
FROM agents
JOIN authors ON agents.author_name = authors.author_name
WHERE agents.author_revenue > 60000;

--list authors, agents, and the titles of the books they've authored 
-- that have a price of more than 700 pence.
-----------------------------------------------------------------------

SELECT
    authors.author_name,
    agents.agent_name,
    books.book_title,
    books.price_in_pence
FROM books
LEFT JOIN authors ON authors.author_id = books.book_id
LEFT JOIN agents ON agents.author_name = authors.author_name
WHERE books.price_in_pence > 700;


-- list authors, agents, and the titles of the books they've authored, 
-- where there are more than 100 copies in stock.
---------------------------------------------------------------------------

SELECT
    authors.author_name,
    agents.agent_name,
    books.book_title,
    books.quantity_in_stock
FROM books
LEFT JOIN authors ON authors.author_id = books.book_id
LEFT JOIN agents ON agents.author_name = authors.author_name
WHERE books.quantity_in_stock > 100;

-- list authors along with their agents and the titles of the fiction books they've authored.
----------------------------------------------------------------------------------------------

SELECT
    authors.author_name,
    agents.agent_name,
    books.book_title
FROM books
LEFT JOIN authors ON authors.author_id = books.book_id
LEFT JOIN agents ON agents.author_name = authors.author_name
WHERE books.is_fiction = 't';
-- has to be left join because not all authors have an agent so would lose results 


-- list authors who have only one book in our bookshop, 
-- but who have accrued agents' fees of over £50.
-----------------------------------------------------------------

SELECT
    authors.author_name,
    COUNT(books.book_title) AS total_titles_stocked,
    agents.agent_fee_in_pence
FROM books
JOIN authors ON authors.author_id = books.book_id
JOIN agents ON agents.author_name = authors.author_name
GROUP BY 
    authors.author_name,
    agents.agent_fee_in_pence;