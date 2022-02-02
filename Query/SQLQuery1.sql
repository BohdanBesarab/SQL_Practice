CREATE DATABASE MyFirstDB
ON
(
	NAME = 'MyFirstDB',
	FILENAME = 'H:\MyFirstDB.mdf',
	SIZE = 5MB,
	MAXSIZE = 20MB,
	FILEGROWTH = 5MB
)
LOG ON 
(
	NAME = 'LogMyFirstDB',
	FILENAME = 'H:\MyFirstDB.ldf',
	SIZE = 3MB,
	MAXSIZE = 30MB,
	FILEGROWTH = 3MB
)
COLLATE Cyrillic_General_CI_AS


CREATE DATABASE MyDB
ON
(
	NAME = 'MyDB',
	FILENAME = 'H:\MyDB.mdf',
	SIZE = 5MB,
	MAXSIZE = 20MB,
	FILEGROWTH = 5MB
)
LOG ON 
(
	NAME = 'LogMyDB',
	FILENAME = 'H:\MyDB.ldf',
	SIZE = 3MB,
	MAXSIZE = 30MB,
	FILEGROWTH = 3MB
)
COLLATE Cyrillic_General_CI_AS

-----------------------------------------------------------------------------------

USE MyDB
Go 

CREATE TABLE Worker 
(
	WorkerId smallint IDENTITY NOT NULL,
	Name Varchar (20) NOT NULL, 
	PhoneNumber char (10) NOT NULL
)
GO 

CREATE TABLE Salary 
(
	SalaryId smallint IDENTITY NOT NULL,
	Salary Money NOT NULL, 
	Post Varchar (20) NOT NULL
)
GO

CREATE TABLE WprkerInfo 
(
	InfoId smallint IDENTITY NOT NULL,
	MaritalStatus Varchar (20) NOT NULL, 
	Post Varchar (20) NOT NULL,
	BithDate Date NULL,
	[Address] Varchar (30) NOT NULL
)
GO

