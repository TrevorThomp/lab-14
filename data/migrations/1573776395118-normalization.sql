-- Query 1. Creates second table in the lab14_normal database
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- Query 2. Subquery to retrieve unqiue bookshelf
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

-- Query 3. Adds column to books table
ALTER TABLE books ADD COLUMN bookshelf_id INT;

-- Prepares connection between the two tables
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

-- Modify books table by removing the column bookshelf
ALTER TABLE books DROP COLUMN bookshelf;

-- Modify the data type of the bookshelf_id
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);