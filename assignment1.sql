CREATE DATABASE ASSIGNMENT;
USE ASSIGNMENT;
CREATE TABLE SalesPeople
(Snum INT PRIMARY KEY,
 Sname VARCHAR(100) UNIQUE,
 City Varchar(100),
 Comm INT
);

INSERT INTO SalesPeople (Snum,Sname,City,Comm)
VALUES(1001,'Peel','London',12);
INSERT INTO SalesPeople (Snum,Sname,City,Comm)
VALUES(1002,'Serres','Sanjose',13);
INSERT INTO SalesPeople (Snum,Sname,City,Comm)
VALUES(1004,'Motika','London',11);
INSERT INTO SalesPeople (Snum,Sname,City,Comm)
VALUES(1007,'Rifkin','Barcelona',15);
INSERT INTO SalesPeople (Snum,Sname,City,Comm)
VALUES(1003,'Axelrod','Newyork',10);
SELECT * FROM SalesPeople;
CREATE TABLE Customers
(Cnum INT PRIMARY KEY,
 Cname VARCHAR(100),
 City Varchar(100),
 Snum INT,
 FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);
INSERT INTO Customers (Cnum,Cname,City,Snum)
VALUES(2001,'Hoffman','London', 1001);
INSERT INTO Customers (Cnum,Cname,City,Snum)
VALUES(2002,'Giovanni', 'Rome', 1003);
INSERT INTO Customers (Cnum,Cname,City,Snum)
VALUES(2003  ,'Liu' ,'Sanjose' ,1002);
INSERT INTO Customers (Cnum,Cname,City,Snum)
VALUES(2004  ,'Grass', 'Berlin', 1002);
INSERT INTO Customers (Cnum,Cname,City,Snum)
VALUES(2006 ,'Clemens' ,'London',1001);
INSERT INTO Customers (Cnum,Cname,City,Snum)
VALUES(2008 ,'Cisneros', 'Sanjose', 1007);
INSERT INTO Customers (Cnum,Cname,City,Snum)
VALUES(2007 ,'Pereira', 'Rome', 1004);

SELECT * FROM Customers;

CREATE TABLE Orders
(Onum INT PRIMARY KEY,
 Amt FLOAT,
 Odate VARCHAR(100),
 Cnum INT,
 Snum INT,
 FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum),
 FOREIGN KEY (Cnum) REFERENCES Customers(Cnum)
);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum)
VALUES(3001, 18.69, '3-10-1990', 2008 ,1007);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum)
VALUES(3003, 767.19, '3-10-1990', 2001, 1001);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum)
VALUES(3002, 1900.10, '3-10-1990', 2007, 1004);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum)
VALUES(3005,  5160.45, '3-10-1990', 2003, 1002);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum)
VALUES(3006,  1098.16, '3-10-1990', 2008, 1007);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum)
VALUES(3009, 1713.23, '4-10-1990', 2002, 1003);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum)
VALUES(3007, 75.75, '4-10-1990', 2004, 1002);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum)
VALUES(3008, 4273.00, '5-10-1990', 2006, 1001);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum)
VALUES(3010, 1309.95, '6-10-1990', 2004, 1002);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum)
VALUES(3011, 9891.88, '6-10-1990', 2006, 1001);

SELECT * FROM Orders;

# Count the number of Salesperson whose name begin with ‘a’/’A’

SELECT COUNT(*) FROM SalesPeople WHERE Sname LIKE 'a%' OR 'A%';

#Display all the Salesperson whose all orders worth is more than Rs. 2000

SELECT DISTINCT Sname FROM SalesPeople,Orders WHERE SalesPeople.Snum=Orders.Snum AND Orders.amt>2000;

# Count the number of Salesperson belonging to Newyork.

SELECT COUNT(*) FROM SalesPeople WHERE CITY='Newyork'; 

#Display the number of Salespeople belonging to London and belonging to Paris.

SELECT * FROM SalesPeople WHERE CITY='Newyork' OR CITY='Paris';

#Display the number of orders taken by each Salesperson and their date of orders.

SELECT Sname,Onum,Odate FROM SalesPeople,Orders WHERE SalesPeople.Snum=Orders.Snum;