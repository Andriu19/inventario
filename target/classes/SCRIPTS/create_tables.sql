-- Crear base de datos
CREATE DATABASE InventoryDB;
USE InventoryDB;

-- Tabla de Usuarios
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(50) UNIQUE NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Role NVARCHAR(20) NOT NULL
);

-- Tabla de Productos
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    ProductName NVARCHAR(100) NOT NULL,
    Quantity INT DEFAULT 0,
    Status NVARCHAR(10) DEFAULT 'Active'
);

-- Tabla de Movimientos
CREATE TABLE Movements (
    MovementID INT PRIMARY KEY IDENTITY,
    ProductID INT,
    MovementType NVARCHAR(10),
    Quantity INT,
    MovementDate DATETIME DEFAULT GETDATE(),
    PerformedBy NVARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insertar datos de prueba en la tabla de Usuarios
INSERT INTO Users (Username, Password, Role) VALUES ('admin', 'admin123', 'Admin');
INSERT INTO Users (Username, Password, Role) VALUES ('user1', 'user123', 'User');
INSERT INTO Users (Username, Password, Role) VALUES ('user2', 'user456', 'User');

-- Insertar datos de prueba en la tabla de Productos
INSERT INTO Products (ProductName, Quantity, Status) VALUES ('Product A', 100, 'Active');
INSERT INTO Products (ProductName, Quantity, Status) VALUES ('Product B', 50, 'Active');
INSERT INTO Products (ProductName, Quantity, Status) VALUES ('Product C', 200, 'Inactive');

-- Insertar datos de prueba en la tabla de Movimientos
INSERT INTO Movements (ProductID, MovementType, Quantity, PerformedBy) VALUES (1, 'Entry', 30, 'admin');
INSERT INTO Movements (ProductID, MovementType, Quantity, PerformedBy) VALUES (2, 'Exit', 10, 'user1');
INSERT INTO Movements (ProductID, MovementType, Quantity, PerformedBy) VALUES (3, 'Entry', 50, 'user2');
