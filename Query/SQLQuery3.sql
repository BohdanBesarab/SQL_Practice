CREATE DATABASE CompanyDB 
ON							  
(
	NAME = 'CompanyDB',				
	FILENAME = 'H:\CompanyDB.mdf',	
	SIZE = 30MB,                    
	MAXSIZE = 100MB,				
	FILEGROWTH = 10MB				
)
LOG ON						  
( 
	NAME = 'LogCompanyDB',		       
	FILENAME = 'H:\CompanyDB.ldf',      
	SIZE = 5MB,                        
	MAXSIZE = 50MB,                    
	FILEGROWTH = 5MB                   
)               
COLLATE Cyrillic_General_CI_AS


USE CompanyDB             
GO  


CREATE TABLE Department
(                                      
	DepartmentID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	DepartmentName varchar(30) NOT NULL
)
GO	  

CREATE TABLE Employees
(                                      
	EmployeesID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	FrsName varchar(25) NOT NULL,
	LastName varchar(25) NOT NULL,
	SecName varchar(25) NOT NULL,
	BirthDate date NOT NULL,
	Address1 varchar(25) NOT NULL,
	Phone char(12) NOT NULL,
	DepartmentID int NOT NULL						                        
    FOREIGN KEY REFERENCES Department(DepartmentID) -- один до багатьох
)
GO	


CREATE TABLE Task
(                                      
	TaskID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	Task varchar(50) NOT NULL,
	DateBegin date NOT NULL,
	EmployeesID int NOT NULL						                        
    FOREIGN KEY REFERENCES Employees(EmployeesID) -- один до багатьох
)
GO	


INSERT INTO Department																			   
VALUES
('Відділ маркетинга'),
('Відділ продаж');	
GO

Select * From Department


INSERT INTO Employees																			   
(FrsName, SecName, LastName, BirthDate, Address1, Phone, DepartmentID)
VALUES
('Артем', 'Олегович', 'Бойко',   '08/08/1987', 'Пасічна 22','(093)1231212',1),
('Денис', 'Вікторович', 'Гусев', '05/12/1985', 'Сахарова 100, 2','(063)1161232',1),	
('Марія', 'Сергіївна', 'Кравець', '05/12/1985', 'Хімічна 28, 34','(067)2261734',2);
GO

Select * From Employees

INSERT INTO Task	
(Task, DateBegin, EmployeesID)																	   
VALUES
('Створення іміджу','05/02/2012', 1),
('Аналіз Інформації','07/01/2014', 2),
('Розробка прогноз продажів','07/01/2014', 2),
('Продаж товару','05/01/2013', 3);
GO

Select * From Department
Select * From Employees
Select * From Task

--***********************************************************************************

CREATE DATABASE StokDB 
ON							  
(
	NAME = 'StokDB',				
	FILENAME = 'H:\StokDB.mdf',	
	SIZE = 30MB,                   
	MAXSIZE = 100MB,				
	FILEGROWTH = 10MB				
)
LOG ON						  
( 
	NAME = 'LogStokDB',		       
	FILENAME = 'H:\StokDB.ldf',      
	SIZE = 5MB,                        
	MAXSIZE = 50MB,                    
	FILEGROWTH = 5MB                   
)               
COLLATE Cyrillic_General_CI_AS

-----------------------------
USE StokDB             
GO   

CREATE TABLE Staff 
(                                      
	StaffID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	Name varchar(25) NOT NULL,
	Post varchar(40) NOT NULL,
	Contact  varchar(25) NOT NULL,
	Phone char(12) NOT NULL
)
GO	

CREATE TABLE Provider 
(                                      
	ProvaiderID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	ProviderName varchar(25) NOT NULL,
	Product varchar(25) NOT NULL,
	Address1 varchar(25) NOT NULL,
	Contact  varchar(25) NOT NULL,
	City     varchar(15) NOT NULL,
	Phone char(12) NOT NULL,
	StaffID int NOT NULL						                        
    FOREIGN KEY REFERENCES Staff(StaffID)
)
GO		

CREATE TABLE Customers
(                                      
	CustomerID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	Name varchar(25) NOT NULL,
	Address1 varchar(25) NOT NULL,
	City     varchar(15) NOT NULL,
	Contact  varchar(25) NOT NULL,
	Phone char(12) NOT NULL,
	StaffID int NOT NULL						                        
    FOREIGN KEY REFERENCES Staff(StaffID) -- Один до багатьох
)
GO	

------Заповнюємо таблиці

INSERT INTO Staff 																			   
(Name, Post, Contact, Phone)
VALUES
('Андрієва А. В', 'Менеджер по закупівлі','Andreev32@mail.ru','(093)9831282'),
('Тарасенко В. В', 'Менеджер по продажі','Tarasov@gmail.ru','(093)1991252');
GO

Select * From Staff 

INSERT INTO Provider 																			   
(ProviderName, Product, Address1, City, Contact, Phone, StaffID )
VALUES
('XCompany', 'Ноутбуки','Виговського 1','Львів', 'xcompany@gmail.ru','(098)2391555', 1),
('YCompany', 'Мобільні телефони','Арманова 25','Київ', 'ycom@gmail.ru','(063)1411525', 1);
GO

Select * From Provider 

INSERT INTO Customers 																			   
(Name, Address1, City, Contact, Phone, StaffID )
VALUES
('Гармаш Д. Н', 'Антоновича 2','Львів', 'garmash90@mail.ru','(067)4591335', 2);
GO


Select * From Staff 
Select * From Provider
Select * From Customers


--***************************************************************************


CREATE DATABASE ShopDB
ON							  
(
	NAME = 'ShopDB',				
	FILENAME = 'H:\ShopDB.mdf',	
	SIZE = 30MB,                    
	MAXSIZE = 90MB,				
	FILEGROWTH = 10MB				
)
LOG ON						  
( 
	NAME = 'ShopDB',		       
	FILENAME = 'H:\BACKUP_DB/ShopDB.ldf',      
	SIZE = 5MB,                        
	MAXSIZE = 40MB,                    
	FILEGROWTH = 4MB                   
)               
COLLATE Cyrillic_General_CI_AS

USE ShopDB
GO

-----create tables

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


ALTER TABLE Orders ADD CONSTRAINT
	FK_Orders_Customers FOREIGN KEY (CustomerNo)		--Orders_Customers
	REFERENCES Customers(CustomerNo)
GO

ALTER TABLE Orders ADD CONSTRAINT
	FK_Orders_Employees FOREIGN KEY (EmployeeId)		--Orders_Employees
	REFERENCES Employees(EmployeeId)
GO

DROP TABLE Orders;
DROP TABLE Customers;
DROP TABLE Employees;

