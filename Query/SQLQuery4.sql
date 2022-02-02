CREATE DATABASE HomeWork1
ON							  
(
	NAME = 'HomeWork1',				
	FILENAME = 'H:\Database/HomeWork1.mdf',	
	SIZE = 5MB,                    
	MAXSIZE = 30MB,				
	FILEGROWTH = 5MB				
)
LOG ON						  
( 
	NAME = 'LogHomeWork1',		       
	FILENAME = 'H:\BACKUP_DB/HomeWork1.ldf',     
	SIZE = 5MB,                        
	MAXSIZE = 30MB,                    
	FILEGROWTH = 5MB                   
)               
COLLATE Cyrillic_General_CI_AS 

USE HomeWork1
GO

------Create tables

CREATE TABLE Info
(
    EmployeesID int IDENTITY NOT NULL 
    PRIMARY KEY,
	Name varchar(60) NOT NULL,
	Post varchar(70) NOT NULL,
	Info varchar(60) NOT NULL,
	History varchar(60) NOT NULL
)
GO

INSERT INTO Info
VALUES
('Головний директор $1000','Андріїв А.В. (093)9831282 andreev44@mail.ru', 'Не одружений Львів 08/15/1975', 'Менеджер 5 р. Google'),
('Головний директор $1000','Андріїв А.В. (093)9831282 andreev44@mail.ru', 'Не одружений Львів 08/15/1975', 'Менеджер 2 р. Microsoft'),
('Менеджер $500 ','Бойко М. К. (067)9831311 boyko_M_K@gmail.ru', 'Одружений Київ 01/01/1990', 'Ні'),
('Робочий $200 ', 'Гусев А. В. (098)9831411 gus@mail.ru', 'Не одружений Київ 03/11/1985', 'Менеджер 3 р. ASUS'),
('Менеджер $400 ', 'Кравець А. В.  (097)9811182 krava@ukr.net','Не одружена Одеса 05/10/1977', '5 м. HP'),
('Робочий $250  ','Тарасенко В. О. (063)1491352 tarasenko_v@ukr.net','Одружений Полтава 02/04/1991', 'Ні');

SELECT * FROM Info



 CREATE TABLE Post
(                                      
	PostID int IDENTITY NOT NULL 
    PRIMARY KEY,
	Post varchar(25) NOT NULL,				  
)
GO	


 CREATE TABLE Employees
(                                      
	EmployeesID int IDENTITY NOT NULL 
    PRIMARY KEY,
	Name varchar(25) NOT NULL,				  
	Phone char(12) Not NULL,
	Contact varchar(30) NOT NULL,
	Salary money NOT NULL,
	PostID int NOT NULL 					                        
    FOREIGN KEY REFERENCES Post(PostID)
)
GO


CREATE TABLE InfoEmployees
(                                      
	InfoEmployeesID int IDENTITY NOT NULL 
    PRIMARY KEY
    FOREIGN KEY REFERENCES Employees(EmployeesID),				  
	MaritalStatus varchar(25) NOT NULL,
	BirthDate date NOT NULL, 
	Locations Varchar (30) NOT NULL
)
GO	


CREATE TABLE WorkHistory
(                                      
	WorkHistoryID int IDENTITY NOT NULL ,				  
	PostID int NOT NULL						                        
    FOREIGN KEY REFERENCES Post(PostID),
	Experience varchar(25) NOT NULL, 
	Company Varchar (30) NOT NULL,
	EmployeesID int NOT NULL						                        
    FOREIGN KEY REFERENCES Employees(EmployeesID),
	PRIMARY KEY (WorkHistoryID, EmployeesID)
)
GO

INSERT INTO Post																			   
VALUES
('Головний директор'),
('Менеджер'),
('Робочий');
GO

INSERT INTO Employees																			   
(Name, Phone, Contact, Salary, PostID)
VALUES
('Андріїва А. В.','(093)9831282','andreev44@mail.ru','$1000',1 ),
('Бойко М. К.','(067)9831311','boyko_M_K@gmail.ru','$500',2),
('Гусев О. А.','(098)9831411','gus@mail.ru','$200',3),
('Кравець Н. Н.','(097)9811182','krava@ukr.net','$400',2),
('Тарасенко В. О.', '(063)1491352','tarasenko_v@ukr.net','$250',3);
GO

INSERT INTO InfoEmployees																			   
(MaritalStatus, Locations, BirthDate)
VALUES
('Не одружений','Київ', '08/15/1975'),
('Одружений','Львів',   '01/01/1990'),
('Не одружений','Київ', '03/11/1985'),
('Не одружений','Херсон','05/10/1977'),
('Одружений','Полтава', '02/04/1991');
GO

INSERT INTO WorkHistory																			   
(PostID, Experience, Company, EmployeesID)
VALUES
(2,'2 ã.', 'Google', 1),
(2,'5 ã.', 'Microsoft', 1),
(2,'3 ã.', 'ASUS', 3),
(3,'5 ì.','HP', 4);
GO

SELECT * FROM Info 
Select * From Post
Select * From Employees
Select * From InfoEmployees
Select * From WorkHistory

--******************************************************************
CREATE DATABASE HomeWork4 
ON							 
(
	NAME = 'HomeWork4 ',				
	FILENAME = 'H:\Database/HomeWork4 .mdf',	
	SIZE = 30MB,                    
	MAXSIZE = 100MB,				
	FILEGROWTH = 10MB				
)
LOG ON						  
( 
	NAME = 'LogHomeWork4 ',		       
	FILENAME = 'H:\BACKUP_DB/HomeWork4 .ldf',      
	SIZE = 5MB,                       
	MAXSIZE = 50MB,               
	FILEGROWTH = 5MB                  
)               
COLLATE Cyrillic_General_CI_AS

USE HomeWork4               
GO   

CREATE TABLE Info
(                                      
	InfoID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	Name varchar(35) NOT NULL, --Прізвище
	Platoon varchar(25) NOT NULL, --Взвод
	Weapons varchar(15) NOT NULL, --Зброя
	GiveRank  varchar(35) NOT NULL, --Зброю видав
)
GO	


INSERT INTO Info																			   
VALUES
('Петров Ф. А., оф.205', '222', 'АК-47', 'Буров О. С., Майор'),
('Петров Ф. А., оф.205', '222', 'Глок20', 'Рибаков Н. Г., Майор'),
('Васильків О. В., оф.221', '232', 'АК-47', 'Сенютка В. А., Підполковник'),
('Ліске А. В., оф.221', '232', 'Глок20', 'Паращенко В. А.,Майор'),
('Тарасенко А. В., оф.201', '212', 'АК-47', 'Нечесний А. В., Майор'),
('Гліненко В. Я., оф.201', '212', 'Глок20', 'Корба Ю. Р., Майор'),
('Стасів Н. Г.', '200', 'ÀÊ-47', 'Дацько Б. О., Майор');

SELECT * FROM Info


CREATE TABLE ArmoryCustomer
(
	ArmoryCustomerID int IDENTITY NOT NULL
	PRIMARY KEY,
	Name varchar(20) NOT NULL,
	[Off] varchar(10) NULL,
	Platoon int NOT NULL
)
GO


CREATE TABLE ArmoryProvider
(
	ArmoryProviderID int IDENTITY NOT NULL 
	PRIMARY KEY,
	Name Varchar(20) NOT NULL,
	[Rank] Varchar(20) NOT NULL
)
GO


 CREATE TABLE Weapons
 (
	WeaponsId smallint IDENTITY NOT NULL 
	PRIMARY KEY,
	Name Varchar(20) NOT NULL,
 )
GO

 CREATE TABLE Give
(
	GiveId int IDENTITY NOT NULL
	PRIMARY KEY,
	ArmoryCustomerID int NOT NULL FOREIGN KEY 
	REFERENCES ArmoryCustomer(ArmoryCustomerID),
	ArmoryProviderID int NOT NULL FOREIGN KEY 
	REFERENCES ArmoryProvider(ArmoryProviderID),
	WeaponsId smallint NOT NULL FOREIGN KEY 
	REFERENCES Weapons(WeaponsId)
)
GO 



INSERT INTO ArmoryCustomer  
VALUES
('Петров Ф. А.', 205, 222), 
('Васильків О. В.' , 221, 232),
('Ліске А. В.', 201, 212),
('Стасів Н. Г.', NULL, 200)
GO

INSERT INTO ArmoryProvider  
VALUES
('Буров О. С.', 'Майор'), 
('Рибаков Н. Г.' , 'Майор'),
('Сенютка В. А..', 'Підполковник')
GO

INSERT INTO Weapons  
VALUES
('АК-47'), 
('Глок20'),
('АК-74')

INSERT INTO Give 
VALUES
(1,  1, 1), 
(1,  2, 2),
(2,  3, 3),
(2,  2, 2),
(3,  1, 1),
(3,  2, 2),
(4,  1, 1)
GO

SELECT * FROM Info
SELECT * FROM ArmoryCustomer
SELECT * FROM ArmoryProvider
SELECT * FROM Weapons
SELECT * FROM Give 


SELECT AC.Name, AC.[Off], AC.Platoon,
W.Name, AP.Name, AP.[Rank]
FROM 
ArmoryCustomer AC INNER JOIN Give G ON AC.ArmoryCustomerID = G.ArmoryCustomerID
INNER JOIN ArmoryProvider AP ON G.ArmoryProviderID = AP.ArmoryProviderID
INNER JOIN Weapons W ON G.WeaponsID = W.WeaponsID

SELECT * FROM Info