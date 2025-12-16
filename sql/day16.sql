\c bookshop

-- list agent names, and the quantity of books in stock by authors that they represent.
------------------------------------------------------------------------------------------

SELECT
    agents.agent_name,
    SUM(books.quantity_in_stock) AS total_books
FROM agents
JOIN authors ON agents.author_name = authors.author_name
JOIN books ON authors.author_id = books.author_id
GROUP BY agents.agent_name
ORDER BY agents.agent_name;

-- list authors along with their agents and the average price of the books they've authored.
---------------------------------------------------------------------------------------------

--SELECT * FROM books;

SELECT
    ag.author_name,
    ag.agent_name,
    ROUND(AVG(b.price_in_pence),2) AS average_book_price
FROM agents ag
JOIN authors au ON ag.author_name = au.author_name
JOIN books b ON au.author_id = b.author_id
GROUP BY ag.author_name, ag.agent_name; 





