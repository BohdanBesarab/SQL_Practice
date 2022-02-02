CREATE DATABASE ClassWork4

USE ClassWork4
GO

CREATE TABLE Employees 
(                                      
	EmployeeId int NOT NULL, 
	FName nvarchar (15) NOT NULL,
	LName nvarchar (15) NOT NULL,
	MName nvarchar (15) NOT NULL,
	Salary money NOT NULL,
	PriorSalary money NOT NULL,
	HireDate date NOT NULL,
	TerminationDate date NOT NULL,
	ManageEmpId int NULL
)
GO	
ALTER TABLE Employees ADD
	CONSTRAINT PK_Employees PRIMARY KEY(EmployeeId)  -- add keys to Employees
GO

CREATE TABLE Customers 
(
	CustomerNo int NOT NULL IDENTITY,
	FName nvarchar (15) NOT NULL,
	LName nvarchar (15) NOT NULL,
	MName nvarchar (15) NOT NULL,
	Address1 nvarchar (50) NOT NULL,
	Address2 nvarchar (50) NOT NULL,
	City nchar (10) NOT NULL,
	Phone char (12) NOT NULL,
	DateInSystem date NULL
)
GO

ALTER TABLE Customers ADD
	CONSTRAINT PK_Customers PRIMARY KEY(CustomerNo)		-- add keys to Employees
GO


CREATE TABLE Orders 
(
	OrderID int NOT NULL IDENTITY,
	CustomerNo int NOT NULL,
	OrderDate date NULL,
	EmployeeID int NULL
)
GO

ALTER TABLE Orders ADD
	CONSTRAINT PK_Orders PRIMARY KEY(OrderID)			-- add keys to Employees
GO

---------------------------------------------

ALTER TABLE Orders ADD CONSTRAINT
	FK_Orders_Customers FOREIGN KEY (CustomerNo)		--Orders_Customers
	REFERENCES Customers(CustomerNo)
GO

ALTER TABLE Orders ADD CONSTRAINT
	FK_Orders_Employees FOREIGN KEY (EmployeeId)		--Orders_Employees
	REFERENCES Employees(EmployeeId)
GO


CREATE TABLE Product
(
	ProdID int NOT NULL IDENTITY,
	[Description] nchar (50) NOT NULL,
	UnitPrice money NULL,
	[Weight] numeric (18, 0) NULL
)
GO
ALTER TABLE Product ADD CONSTRAINT
	PK_Product PRIMARY KEY(ProdID)			-- add keys to Employees
GO

CREATE TABLE OrderDetails
(
	OrderID int NOT NULL,
	LineItem int NOT NULL,
	ProdID int NULL,
	Qty int NOT NULL,
	UnitPrice money Not NUll,
)
GO
ALTER TABLE OrderDetails ADD CONSTRAINT
	PK_OrderDetails PRIMARY KEY(
								OrderID,
								LineItem
								)
GO

ALTER TABLE OrderDetails ADD CONSTRAINT
	FK_OrderDetails_Products FOREIGN KEY(ProdID)
		REFERENCES Product(ProdID)
GO
ALTER TABLE OrderDetails ADD CONSTRAINT
	FK_OrderDetails_Orders FOREIGN KEY(OrderID)
		REFERENCES Orders(OrderID)
GO