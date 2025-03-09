-- Create the database
CREATE DATABASE FlowerShop;
GO

USE FlowerShop;
GO

-- Create the Category table
CREATE TABLE Category (
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL
);
GO

-- Create the Flower table
CREATE TABLE Flower (
    FlowerId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Type NVARCHAR(100),
    Price DECIMAL(18, 2) NOT NULL,
    CategoryId INT FOREIGN KEY REFERENCES Category(CategoryId)
);
GO

-- Seed sample data
INSERT INTO Category (Name) VALUES ('Roses'), ('Tulips');
INSERT INTO Flower (Name, Type, Price, CategoryId) VALUES 
('Red Rose', 'Hybrid', 10.99, 1),
('White Rose', 'Classic', 9.99, 1),
('Yellow Tulip', 'Dutch', 5.99, 2),
('Pink Tulip', 'Dutch', 6.99, 2);
GO

-- Stored Procedures for CRUD Operations

-- Get all flowers
CREATE PROCEDURE GetAllFlowers
AS
BEGIN
    SELECT f.FlowerId, f.Name, f.Type, f.Price, c.Name AS CategoryName
    FROM Flower f
    INNER JOIN Category c ON f.CategoryId = c.CategoryId;
END
GO

-- Get flower by ID
CREATE PROCEDURE GetFlowerById
    @FlowerId INT
AS
BEGIN
    SELECT f.FlowerId, f.Name, f.Type, f.Price, c.Name AS CategoryName
    FROM Flower f
    INNER JOIN Category c ON f.CategoryId = c.CategoryId
    WHERE f.FlowerId = @FlowerId;
END
GO

-- Add a new flower
CREATE PROCEDURE AddFlower
    @Name NVARCHAR(100),
    @Type NVARCHAR(100),
    @Price DECIMAL(18, 2),
    @CategoryId INT
AS
BEGIN
    INSERT INTO Flower (Name, Type, Price, CategoryId)
    VALUES (@Name, @Type, @Price, @CategoryId);
END
GO

-- Update a flower
CREATE PROCEDURE UpdateFlower
    @FlowerId INT,
    @Name NVARCHAR(100),
    @Type NVARCHAR(100),
    @Price DECIMAL(18, 2),
    @CategoryId INT
AS
BEGIN
    UPDATE Flower
    SET Name = @Name, Type = @Type, Price = @Price, CategoryId = @CategoryId
    WHERE FlowerId = @FlowerId;
END
GO

-- Delete a flower
CREATE PROCEDURE DeleteFlower
    @FlowerId INT
AS
BEGIN
    DELETE FROM Flower WHERE FlowerId = @FlowerId;
END
GO