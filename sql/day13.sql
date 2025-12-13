\c bookshop

-- Get a list of all the unique prices that are on offer 
-- in the book table.
----------------------------------------------------------

SELECT DISTINCT
    price_in_pence
FROM books;

-- Create Agent's table
----------------------------

DROP TABLE IF EXISTS agents;

CREATE TABLE agents (
    agent_id SERIAL PRIMARY KEY,
    agent_name VARCHAR(50),
    author_name VARCHAR(50),
    author_contact_details TEXT,
    author_revenue FLOAT
);

INSERT INTO agents 
    (agent_name, author_name, author_contact_details, author_revenue)
VALUES
    ('Galactic Literary Agency', 'Douglas Adams', 'douglas@email.com', 89900),
    ('Prince Literary Services', 'Antoine de Saint-Exupéry', 'antoine@email.com', 69900),
    ('Rabbit Representation', 'Beatrix Potter', 'beatrix@email.com', 59900),
    ('Austen Authors Agency', 'Jane Austen', 'jane@email.com', 52200),
    ('Orwell Literary Management', 'George Orwell', 'george@email.com', 79900),
    ('Galactic Literary Agency', 'Stephen Hawking', 'stephen@email.com', 67900),
    ('Galactic Literary Agency', 'H. G. Wells ', 'wells@email.com', 93900)
    ;

        --  1 | Dan Brown                       
        --  5 | Eric Carle               
        --  6 | J. D. Salinger           
        --  9 | Roald Dahl               
        -- 10 | Frank Herbert            
        -- 11 | Louis de Bernières             
        -- 15 | Margaret Atwood          

SELECT * FROM agents;

-- List all agents' names and contact details
------------------------------------------------

SELECT
    agent_name,
    author_contact_details
FROM
    agents;

--List agents who represent authors with a revenue greater than £800
----------------------------------------------------------------------

SELECT
    agent_name,
    author_revenue
FROM
    agents
WHERE author_revenue > 80000;

-- List all agents and the total revenue they generate from authors
---------------------------------------------------------------------

SELECT
    agent_name,
    SUM(author_revenue) AS total_revenue
FROM agents
GROUP BY agent_name;


-- List the agents that represent the author with the highest revenue
-----------------------------------------------------------------------

-- SELECT
--     agent_name,
--     author_revenue AS highest_revenue
-- FROM agents
-- ORDER BY highest_revenue DESC
-- LIMIT 1;

SELECT
    agent_name,
    author_revenue AS highest_revenue
FROM agents
WHERE author_revenue = (
    SELECT MAX(author_revenue)
    FROM agents
);

-- The total number of authors represented
--------------------------------------------

SELECT DISTINCT
    COUNT(author_name) AS total_authors_represented
FROM agents;