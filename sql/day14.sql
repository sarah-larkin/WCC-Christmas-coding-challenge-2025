\c bookshop

-- Alter the agents table to have an agent_fee_in_pence column
-----------------------------------------------------------------

ALTER TABLE agents
    ADD COLUMN IF NOT EXISTS agent_fee_in_pence INT;


--An agent's fee is 10% of the author's revenue in pence.
-----------------------------------------------------------

UPDATE agents
SET agent_fee_in_pence = author_revenue * 0.1;


-- the agents who work for an Agency have now demanded a 15% fee
--------------------------------------------------------------------

UPDATE agents
    SET agent_fee_in_pence = 
    CASE 
        WHEN agent_name LIKE '%Agency' THEN author_revenue * 0.15
        ELSE author_revenue * 0.1
    END;

-- UPDATE agents
-- SET agent_fee_in_pence = author_revenue * 0.15
-- WHERE agent_name LIKE '%Agency';

SELECT * FROM agents;

-- find the agent with the cheapest fee in the table
------------------------------------------------------

SELECT 
    agent_name 
FROM agents
WHERE agent_fee_in_pence = (SELECT MIN(agent_fee_in_pence) FROM agents);


-- find the average agent fee and the average author revenue
------------------------------------------------------------------

SELECT
    ROUND(AVG(agent_fee_in_pence),2) AS average_agent_fee,
    ROUND(AVG(author_revenue),2) AS average_author_revenue
FROM agents;

-- updated agents table from float to int for author_revenue
-- should not use float for money - rounding issues 