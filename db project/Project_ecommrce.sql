-- Create Database
CREATE DATABASE Ecommerce;
USE Ecommerce;

-- The User table with UserID as an identity column
CREATE TABLE  Users (
    UserID INT PRIMARY KEY auto_increment,
    Username VARCHAR(50),
    Password VARCHAR(255),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15)
);


CREATE TABLE Product (
    ProductID INT PRIMARY KEY auto_increment,
    ProductName VARCHAR(100),
    Descript text,
    Price DECIMAL(10, 2),
    StockQuantity INT
);


-- Category Table
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY auto_increment,
    CategoryName VARCHAR(100)
);


-- Order Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY auto_increment,
    UserID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailsID INT PRIMARY KEY auto_increment,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


-- Cart Table
CREATE TABLE Cart (
    CartID INT PRIMARY KEY auto_increment,
    UserID INT,
    CreatedDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
);


-- CartItem Table
CREATE TABLE CartItem (
    CartItemID INT PRIMARY KEY auto_increment,
    CartID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


-- Payment Table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY auto_increment,
    OrderID INT,
    PaymentDate DATETIME,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);


-- Review Table
CREATE TABLE Review (
    ReviewID INT PRIMARY KEY auto_increment,
    ProductID INT,
    UserID INT,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    Comment text,
    ReviewDate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
);


-- Shipping Table
CREATE TABLE Shipping (
    ShippingID INT PRIMARY KEY auto_increment,
    OrderID INT,
    ShippingAddress VARCHAR(255),
    ShippingDate DATETIME,
    DeliveryDate DATETIME,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);


-- Insert into User Table
INSERT INTO Users (Username, Password, Email, PhoneNumber) 
VALUES 
    ('Ahmed_Ali', 'password123', 'ahmed@example.com', '3001234567'),
    ('Fatima_Khan', 'password456', 'fatima@example.com', '3219876543'),
    ('Ayesha_Ahmed', 'alicePass789', 'ayesha@example.com', '3331112233'),
    ('Imran_Raza', 'bobPassword', 'imran@example.com', '3455678901'),
    ('Sana_Malik', 'charliePass123', 'sana@example.com', '3004445566'),
    ('Ali_Rizvi', 'davePass321', 'ali@example.com', '3223334455'),
    ('Zara_Saeed', 'evePass654', 'zara@example.com', '3115556677');
    
    
    
-- Insert into Product Table
INSERT INTO Product (ProductName, Descript, Price, StockQuantity)
VALUES 
    ('Laptop', '14-inch laptop', 800.00, 10),
    ('Smartphone', 'Android smartphone', 500.00, 20),
    ('Tablet', '10-inch tablet', 300.00, 15),
    ('Monitor', '24-inch monitor', 200.00, 8),
    ('Keyboard', 'Mechanical keyboard', 100.00, 25),
    ('Mouse', 'Wireless mouse', 50.00, 30),
    ('Headphones', 'Noise-cancelling headphones', 150.00, 12);



-- Insert into Category Table
INSERT INTO Category (CategoryName)
VALUES 
    ('Electronics'),
    ('Furniture'),
    ('Computers'),
    ('Accessories'),
    ('Gadgets');



-- Insert into Order Table
INSERT INTO Orders (UserID, OrderDate, TotalAmount)
VALUES 
    (1, '2023-06-01 10:00:00', 1300.00),
    (2, '2023-06-02 11:00:00', 500.00),
    (3, '2023-06-03 12:00:00', 300.00),
    (4, '2023-06-04 13:00:00', 200.00),
    (5, '2023-06-05 14:00:00', 100.00),
    (6, '2023-06-06 15:00:00', 50.00),
    (7, '2023-06-07 16:00:00', 950.00);



-- Insert into OrderDetails Table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES 
    (1, 1, 1, 800.00),
    (1, 2, 1, 500.00),
    (2, 2, 1, 500.00),
    (3, 3, 1, 300.00),
    (4, 4, 1, 200.00),
    (5, 5, 1, 100.00),
    (6, 6, 1, 50.00),
    (7, 1, 1, 800.00),
    (7, 7, 1, 150.00);



-- Insert into Cart Table
INSERT INTO Cart (UserID, CreatedDate)
VALUES 
    (1, '2023-05-25 09:00:00'),
    (2, '2023-05-26 09:30:00'),
    (3, '2023-05-27 10:00:00'),
    (4, '2023-05-28 10:30:00'),
    (5, '2023-05-29 11:00:00'),
    (6, '2023-05-30 11:30:00'),
    (7, '2023-05-31 12:00:00');



-- Insert into CartItem Table
INSERT INTO CartItem (CartID, ProductID, Quantity)
VALUES 
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 1),
    (6, 6, 2),
    (7, 7, 1);



-- Insert into Payment Table
INSERT INTO Payment (OrderID, PaymentDate, PaymentMethod, Amount)
VALUES 
    (1, '2023-06-01 12:00:00', 'Credit Card', 1300.00),
    (2, '2023-06-02 13:00:00', 'PayPal', 500.00),
    (3, '2023-06-03 14:00:00', 'Credit Card', 300.00),
    (4, '2023-06-04 15:00:00', 'Debit Card', 200.00),
    (5, '2023-06-05 16:00:00', 'Credit Card', 100.00),
    (6, '2023-06-06 17:00:00', 'Bank Transfer', 50.00),
    (7, '2023-06-07 18:00:00', 'Credit Card', 950.00);



-- Insert into Review Table
INSERT INTO Review (ProductID, UserID, Rating, Comment, ReviewDate)
VALUES 
    (1, 1, 5, 'Great product!', '2023-06-05 14:00:00'),
    (2, 2, 4, 'Good value for the price.', '2023-06-06 15:00:00'),
    (3, 3, 4, 'Very satisfied with this tablet.', '2023-06-07 16:00:00'),
    (4, 4, 5, 'Excellent monitor!', '2023-06-08 17:00:00'),
    (5, 5, 3, 'Keyboard is okay.', '2023-06-09 18:00:00'),
    (6, 6, 4, 'Good mouse, very responsive.', '2023-06-10 19:00:00'),
    (7, 7, 5, 'Amazing headphones!', '2023-06-11 20:00:00');



-- Insert into Shipping Table
INSERT INTO Shipping (OrderID, ShippingAddress, ShippingDate, DeliveryDate)
VALUES 
    (1, '123 Main St, Springfield, IL', '2023-06-01 16:00:00', '2023-06-05 10:00:00'),
    (2, '456 Elm St, Springfield, IL', '2023-06-02 17:00:00', '2023-06-06 11:00:00'),
    (3, '789 Oak St, Springfield, IL', '2023-06-03 18:00:00', '2023-06-07 12:00:00'),
    (4, '101 Pine St, Springfield, IL', '2023-06-04 19:00:00', '2023-06-08 13:00:00'),
    (5, '202 Maple St, Springfield, IL', '2023-06-05 20:00:00', '2023-06-09 14:00:00'),
    (6, '303 Cedar St, Springfield, IL', '2023-06-06 21:00:00', '2023-06-10 15:00:00'),
    (7, '404 Birch St, Springfield, IL', '2023-06-07 22:00:00', '2023-06-11 16:00:00');


-- Show data from User Table
SELECT * FROM Users;

-- Show data from Product Table
SELECT * FROM Product;

-- Show data from Category Table
SELECT * FROM Category;

-- Show data from Order Table
SELECT * FROM Orders;

-- Show data from OrderDetails Table
SELECT * FROM OrderDetails;

-- Show data from Cart Table
SELECT * FROM Cart;

-- Show data from CartItem Table
SELECT * FROM CartItem;

-- Show data from Payment Table
SELECT * FROM Payment;

-- Show data from Review Table
SELECT * FROM Review;

-- Show data from Shipping Table
SELECT * FROM Shipping;

Delimiter //
CREATE PROCEDURE AddUser (
    IN p_Username VARCHAR(50),
    IN p_Password VARCHAR(255),
    IN p_Email VARCHAR(100),
    IN p_PhoneNumber VARCHAR(15)
)
BEGIN
    INSERT INTO Users (Username, Password, Email, PhoneNumber)
    VALUES (p_Username, p_Password, p_Email, p_PhoneNumber);
    
    SELECT LAST_INSERT_ID() AS NewUserID;
END;
// delimiter ;


DELIMITER //
CREATE PROCEDURE AddProduct (
    IN p_ProductName VARCHAR(100),
    IN p_Description TEXT,
    IN p_Price DECIMAL(10,2),
    IN p_StockQuantity INT
)
BEGIN
    INSERT INTO Product (ProductName, Description, Price, StockQuantity)
    VALUES (p_ProductName, p_Description, p_Price, p_StockQuantity);

    -- Return the new ProductID
    SELECT LAST_INSERT_ID() AS NewProductID;
END 
//DELIMITER ;



DELIMITER //
CREATE PROCEDURE UpdateProduct (
    IN p_ProductID INT,
    IN p_ProductName VARCHAR(100),
    IN p_Description TEXT,
    IN p_Price DECIMAL(10,2),
    IN p_StockQuantity INT
)
BEGIN
    UPDATE Product
    SET ProductName = p_ProductName,
        Description = p_Description,
        Price = p_Price,
        StockQuantity = p_StockQuantity
    WHERE ProductID = p_ProductID;
END 
// DELIMITER ;



DELIMITER //
CREATE PROCEDURE PlaceOrder (
    IN p_UserID INT,
    IN p_CartID INT,
    IN p_OrderDate DATETIME,
    IN p_TotalAmount DECIMAL(10,2)
)
BEGIN
    -- Insert into Orders table
    INSERT INTO Orders (UserID, OrderDate, TotalAmount)
    VALUES (p_UserID, p_OrderDate, p_TotalAmount);

    -- Get the last inserted OrderID
    SET @OrderID = LAST_INSERT_ID();

    -- Insert order details from CartItem
    INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
    SELECT @OrderID, ci.ProductID, ci.Quantity, p.Price
    FROM CartItem ci
    JOIN Product p ON ci.ProductID = p.ProductID
    WHERE ci.CartID = p_CartID;

    -- Remove items from CartItem after placing the order
    DELETE FROM CartItem WHERE CartID = p_CartID;
END 
// DELIMITER ;



DELIMITER //
CREATE PROCEDURE AddToCart (
    IN p_UserID INT,
    IN p_ProductID INT,
    IN p_Quantity INT
)
BEGIN
    -- Insert into CartItem using the existing CartID
    INSERT INTO CartItem (CartID, ProductID, Quantity)
    VALUES (
        (SELECT CartID FROM Cart WHERE UserID = p_UserID),
        p_ProductID,
        p_Quantity
    );
END;
// delimiter ;



Delimiter //
CREATE PROCEDURE ViewCart (
    IN p_UserID INT
)
BEGIN
    SELECT ci.CartItemID, p.ProductName, p.Description, ci.Quantity, p.Price
    FROM CartItem ci
    JOIN Product p ON ci.ProductID = p.ProductID
    WHERE ci.CartID = (SELECT CartID FROM Cart WHERE UserID = p_UserID);
END;
// delimiter ;



Delimiter //
CREATE PROCEDURE ViewOrderHistory (
    IN p_UserID INT
)
BEGIN
    SELECT o.OrderID, o.OrderDate, o.TotalAmount
    FROM `Order` o  -- `Order` is a reserved keyword, so we use backticks
    WHERE o.UserID = p_UserID;
END;
// delimiter ;


Delimiter //
CREATE PROCEDURE AddReview (
    IN p_ProductID INT,
    IN p_UserID INT,
    IN p_Rating INT,
    IN p_Comment TEXT,
    IN p_ReviewDate DATETIME
)
BEGIN
    INSERT INTO Review (ProductID, UserID, Rating, Comment, ReviewDate)
    VALUES (p_ProductID, p_UserID, p_Rating, p_Comment, p_ReviewDate);
END;
// DELIMITER ;



CALL AddUser ('mary_jane', 'maryPass456', 'mary@example.com', '6677889900');

CALL AddProduct ('Smart Watch', 'Fitness tracker', 150.00, 15);

CALL UpdateProduct (8, 'Smart Watch Series 2', 'Fitness tracker with heart rate monitor', 200.00, 20);

CALL PlaceOrder (8, 8, '2023-06-08 14:00:00', 300.00);

CALL AddToCart (8, 8, 1);

CALL ViewCart (8);

CALL ViewOrderHistory (8);

CALL AddReview (8, 8, 4, 'Great smart watch!', '2023-06-10 10:00:00');

 
-- Drop all procedures
DROP PROCEDURE IF EXISTS AddUser;
DROP PROCEDURE IF EXISTS AddProduct;
DROP PROCEDURE IF EXISTS UpdateProduct;
DROP PROCEDURE IF EXISTS PlaceOrder;
DROP PROCEDURE IF EXISTS AddToCart;
DROP PROCEDURE IF EXISTS ViewCart;
DROP PROCEDURE IF EXISTS ViewOrderHistory;
DROP PROCEDURE IF EXISTS AddReview;


 -- Drop all tables 
DROP TABLE IF EXISTS Shipping;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS CartItem;
DROP TABLE IF EXISTS Cart;
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS `Order`;  -- `Order` is a reserved keyword in MySQL, so use backticks (`) to avoid syntax errors.
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Users;  -- Changed from `[User]` to `Users` (assuming this is the correct table name).




