\c bookshop


-- use Joins 
-- list authors, agents and the titles of the books they've authored, sorted by release date
-----------------------------------------------------------------------------------------------

SELECT
    authors.author_name, -- agents.author_name 
    agents.agent_name,
    books.book_title,
    books.release_date
FROM books
JOIN authors ON books.author_id = authors.author_id
JOIN agents ON authors.author_name = agents.author_name
ORDER BY books.release_date;

-- list contact details for any authors who produce children's books
----------------------------------------------------------------------

SELECT
    ag.author_contact_details,
    ge.genre
FROM agents ag
JOIN authors au ON ag.author_name = au.author_name
JOIN books b ON au.author_id = b.author_id
JOIN books_genres bg ON b.book_id = bg.book_id
JOIN genres ge ON bg.genre_id = ge.genre_id
WHERE ge.genre LIKE 'children%';

-- list authors along with their agents and the number of books they've authored
-----------------------------------------------------------------------------------

SELECT
    au.author_name,
    ag.agent_name,
    COUNT(b.book_title)
FROM authors au
JOIN agents ag ON au.author_name = ag.author_name
JOIN books b ON au.author_id = b.author_id
GROUP BY au.author_name, ag.agent_name;