CREATE DATABASE AdventureWorks2022

USE AdventureWorks2022
GO

CREATE DATABASE HomeWork  
ON							  
(
	NAME = 'HomeWork',				
	FILENAME = 'D:\HomeWork.mdf',	
	SIZE = 10MB,                    
	MAXSIZE = 100MB,				
	FILEGROWTH = 10MB				
)
LOG ON		
(
	NAME = 'LogHomeWork',				   .
	FILENAME = 'D:\HomeWork.ldf',      
	SIZE = 5MB,                        
	MAXSIZE = 50MB,                    
	FILEGROWTH = 5MB                   
)               
COLLATE Cyrillic_General_CI_AS 

USE HomeWork               
GO   

CREATE TABLE Product
(

	ProductId smallint IDENTITY NOT NULL,
	Name Varchar(20) NOT NULL,
	ProductNumber char(10) NOT NULL,
	Cost money NOT NULL,
	[Count] integer NOT NULL,
	SellStartDate date NOT NULL   
)
GO

INSERT INTO Product
(Name,ProductNumber,Cost, [Count] ,SellStartDate) 
VALUES 
('Корона',   'AK-53818 ', '$5',  '50',  '08/15/2011 '),
('Милка',    'AM-51122 ', '$6.1','50',  '07/15/2011 '),
('Світоч',   'AA-52211 ', '$2.5','20',  '06/15/2011 '),
('Snickers', 'BS-32118',  '$2.8','50',  '08/15/2011 '),
('Snickers', 'BSL-3818',  '$5',  '100', '08/20/2011 '),
('Bounty',   'BB-38218 ', '$3',  '100', '08/01/2011 '),
('Nuts',     'BN-37818',  '$3',  '100', '08/21/2011 '),
('Mars ',    'BM-3618 ',  '$2.5','50',  '08/24/2011 '),
('Світоч',   'AS-54181 ', '$5',  '100', '08/12/2011 '),
('Світоч',   'AS-54182 ', '$5',  '100', '08/12/2011 ');
GO

SELECT * FROM Product
WHERE [Count] > 59;


SELECT * FROM Product
WHERE Cost > 3 AND SellStartDate = '08/20/2011';


UPDATE Product
SET Cost = $5.25 
WHERE Name = 'Світоч'
GO

SELECT * FROM Product;

USE  HomeWork
GO

CREATE TABLE Customers
(
	CustomerNo int NOT NULL IDENTITY,
	FName nvarchar (15) NOT NULL,
	LName nvarchar (15) NOT NULL,
	MName nvarchar (15) NOT NULL,
	Address1 nvarchar(50) NOT NULL,
	Address2 nvarchar(50) NOT NULL,
	City nchar (10) NOT NULL,
	Phone char (12) NOT NULL,
	DateInSystem date NULL
)

GO

