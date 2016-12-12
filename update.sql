
CREATE database Books;
use Books;
source Books.sql;

DELETE  Books, Authors 
FROM Books 
LEFT JOIN Authors 
ON Books.authorId=Authors.authorId 
WHERE Books.authorId IS NULL or Authors.authorId IS NULL; 

CREATE TABLE booksGenres( bookId int(11) NOT NULL, genre varchar(40) NOT NULL, CONSTRAINT book_gen_pk PRIMARY KEY (bookId,genre), FOREIGN KEY(bookId) REFERENCES Books(bookId));
INSERT INTO booksGenres (bookId, genre) VALUES(1,"Programming");
INSERT INTO booksGenres (bookId, genre) VALUES(2,"Programming");
INSERT INTO booksGenres (bookId, genre) VALUES(3,"Programming");
INSERT INTO booksGenres (bookId, genre) VALUES(4,"Programming");
INSERT INTO booksGenres (bookId, genre) VALUES(4,"Concurrency");
CREATE TABLE booksAuthors( bookId int(11) NOT NULL, authorId int(11) NOT NULL, CONSTRAINT book_auth_pk PRIMARY KEY (bookId,authorId));
INSERT INTO booksAuthors (bookId, authorId) 
SELECT bookId, authorId 
FROM Books;

ALTER TABLE Books DROP column authorId;
 INSERT INTO booksAuthors (bookId, authorId) VALUES(1,5);
 INSERT INTO booksAuthors (bookId, authorId) VALUES(2,5);
ALTER TABLE Books CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
INSERT INTO Books (title,year) VALUES("ąčęėįšųū",2000);
