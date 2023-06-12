

CREATE DATABASE Library;


-- Table: Books
CREATE TABLE Books (
  BookID INT PRIMARY KEY NOT NULL,
  Title VARCHAR(255),
  Author VARCHAR(255),
  PublicationYear INT,
  Status VARCHAR(50)
);



-- Table: Members
CREATE TABLE Members (
  MemberID INT PRIMARY KEY NOT NULL,
  Name VARCHAR(255),
  Address VARCHAR(255),
  ContactNumber VARCHAR(20)
);

-- Table: Loans
CREATE TABLE Loans (
  LoanID INT PRIMARY KEY NOT NULL,
  BookID INT,
  MemberID INT,
  LoanDate DATE,
  ReturnDate DATE,
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);





-- Inserting data into the Books table
INSERT INTO Books (BookID, Title, Author, PublicationYear, Status)
VALUES
  (1, 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Available'),
  (2, '1984', 'George Orwell', 1949, 'Checked Out'),
  (3, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Available'),
  (4, 'Pride and Prejudice', 'Jane Austen', 1813, 'Available'),
  (5, 'The Catcher in the Rye', 'J.D. Salinger', 1951, 'Checked Out'),
  (6, 'Moby-Dick', 'Herman Melville', 1851, 'Available'),
  (7, 'To the Lighthouse', 'Virginia Woolf', 1927, 'Available'),
  (8, 'The Hobbit', 'J.R.R. Tolkien', 1937, 'Checked Out'),
  (9, 'Brave New World', 'Aldous Huxley', 1932, 'Available'),
  (10, 'The Lord of the Rings', 'J.R.R. Tolkien', 1954, 'Checked Out'),
  (11, 'Jane Eyre', 'Charlotte Bronte', 1847, 'Available'),
  (12, 'The Odyssey', 'Homer', -800, 'Available'),
  (13, 'Crime and Punishment', 'Fyodor Dostoevsky', 1866, 'Checked Out'),
  (14, 'The Adventures of Tom Sawyer', 'Mark Twain', 1876, 'Available'),
  (15, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 1997, 'Checked Out'),
  (16, 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Available'),
  (17, '1984', 'George Orwell', 1949, 'Available'),
  (18, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Checked Out'),
  (19, 'Pride and Prejudice', 'Jane Austen', 1813, 'Available'),
  (20, 'The Catcher in the Rye', 'J.D. Salinger', 1951, 'Available');

-- Inserting data into the Members table
INSERT INTO Members (MemberID, Name, Address, ContactNumber)
VALUES
  (1, 'John Smith', '123 Main Street', '555-1234'),
  (2, 'Emily Johnson', '456 Elm Avenue', '555-5678'),
  (3, 'Michael Brown', '789 Oak Lane', '555-9012'),
  (4, 'Sarah Davis', '321 Pine Road', '555-3456'),
  (5, 'Robert Wilson', '654 Cedar Street', '555-7890'),
  (6, 'Jennifer Thompson', '987 Maple Court', '555-2345'),
  (7, 'David Anderson', '876 Birch Lane', '555-6789'),
  (8, 'Elizabeth Martinez', '543 Oak Avenue', '555-0123'),
  (9, 'Matthew Taylor', '210 Elm Street', '555-4567'),
  (10, 'Olivia Lee', '789 Pine Avenue', '555-8901'),
  (11, 'Daniel White', '432 Cedar Road', '555-2345'),
  (12, 'Sophia Clark', '123 Maple Lane', '555-6789'),
  (13, 'Josephine Scott', '456 Oak Street', '555-0123'),
  (14, 'Andrew Perez', '987 Elm Avenue', '555-4567'),
  (15, 'Charlotte Adams', '210 Pine Road', '555-8901'),
  (16, 'Liam Hall', '789 Cedar Lane', '555-2345'),
  (17, 'Abigail Turner', '543 Maple Court', '555-6789'),
  (18, 'James Parker', '876 Oak Avenue', '555-0123'),
  (19, 'Victoria Hughes', '432 Elm Street', '555-4567'),
  (20, 'Henry Cox', '123 Pine Avenue', '555-8901');

-- Inserting data into the Loans table
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate)
VALUES
  (1, 1, 1, '2023-06-01', '2023-06-08'),
  (2, 2, 2, '2023-06-03', '2023-06-10'),
  (3, 3, 3, '2023-06-05', NULL),
  (4, 4, 4, '2023-06-02', '2023-06-09'),
  (5, 5, 5, '2023-06-04', NULL),
  (6, 6, 6, '2023-06-06', '2023-06-13'),
  (7, 7, 7, '2023-06-01', NULL),
  (8, 8, 8, '2023-06-03', '2023-06-10'),
  (9, 9, 9, '2023-06-05', '2023-06-12'),
  (10, 10, 10, '2023-06-02', NULL),
  (11, 11, 11, '2023-06-04', '2023-06-11'),
  (12, 12, 12, '2023-06-06', '2023-06-13'),
  (13, 13, 13, '2023-06-01', NULL),
  (14, 14, 14, '2023-06-03', '2023-06-10'),
  (15, 15, 15, '2023-06-05', '2023-06-12'),
  (16, 16, 16, '2023-06-02', '2023-06-09'),
  (17, 17, 17, '2023-06-04', NULL),
  (18, 18, 18, '2023-06-06', '2023-06-13'),
  (19, 19, 19, '2023-06-01', '2023-06-08'),
  (20, 20, 20, '2023-06-03', '2023-06-10');

 

  select * from Books 

  /*question one */

  CREATE TRIGGER check_status
  ON Loans
  AFTER INSERT, UPDATE, DELETE 
  AS 
  BEGIN

  UPDATE Books
  SET Books.Status = 'Checked Out'
  WHERE BookID IN (
  SELECT BookID
  FROM inserted
  )

  UPDATE Books
  SET  Books.Status = 'Available'
  WHERE BOOKID IN
  (
  SELECT BookID
  FROM deleted
  )

   
  END



 DELETE FROM Loans WHERE BookID = 1;


 SELECT * FROM LOANS


 SELECT * FROM BOOKS



 DELETE FROM Loans WHERE BookID = 2;



 INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate)
VALUES
  (1, 1, 1, '2023-06-01', NULL);
       

/* QUESTION 2 */

/*question two */
WITH cte_books_borrowed (MemberID, Name)
AS
(
  SELECT 
    Members.MemberID,
    Members.Name 
  FROM Members
  INNER JOIN
  Loans 
    ON Members.MemberID = Loans.MemberID
  GROUP BY Members.MemberID, Members.Name
  HAVING COUNT(Loans.BookID) >= 3
)

SELECT * FROM cte_books_borrowed;



/*question three */
CREATE FUNCTION usdOverdue
(
 @LoanID INT
 )

  RETURNS INT
  AS 
  BEGIN
    DECLARE @OverdueDays INT


	SELECT @OverdueDays = DATEDIFF(DAY, LoanDate, ReturnDate)
	FROM Loans
	WHERE LoanID = @LoanID

	IF @OverdueDays < 0
        SET @OverdueDays = 0
    
    RETURN @OverdueDays
	   





  END


 SELECT dbo.usdOverdue (11) net_sale




 /*question 4 */

 CREATE OR ALTER VIEW daily_sales_product
 AS
 SELECT
    l.LoanID,
	DATEDIFF(DAY, l.LoanDate, l.ReturnDate) AS OverdueDays,
	m.MemberID,
	m.Name,
	b.BookID,
	b.Title,
	b.Author
	FROM 
	   Loans AS l
    INNER JOIN Members AS m
	   ON l.MemberID = m.MemberID
    INNER JOIN Books as b
	 ON l.BookID = b.BookID
	

	 SELECT * from daily_sales_product











 





/*

)
*/


/*question 5*/
 
 CREATE OR ALTER TRIGGER PreventExcessiveBorrowing
ON Loans
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MemberID INT;
    DECLARE @TotalLoans INT;

    -- Get the MemberID and count of current loans for the inserted member
    SELECT @MemberID = MemberID,
           @TotalLoans = COUNT(*)
    FROM Loans
    WHERE MemberID IN (SELECT MemberID FROM inserted)
    GROUP BY MemberID;

    -- Check if the member has reached the maximum number of loans (3)
    IF @TotalLoans >= 3
    BEGIN
        -- Raise an error and cancel the insert operation
        RAISERROR ('The member already has three books on loan. Cannot borrow more.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Insert the new loan records
    INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate)
    SELECT BookID, MemberID, LoanDate, ReturnDate
    FROM inserted;
END;



 
   















  

