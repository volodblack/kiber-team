Create Database Delivery go
 USE Delivery
 Go
CREATE TABLE [Тип клієнта](
[Id] varchar(10) NOT NULL,
[Назва типу ] nvarchar(50) NOT NULL,
[Знижка] int NOT NULL,
[Опис] [nvarchar](150)  null,
constraint [Тип клієнти первинний ключ] Primary Key  (Id)
) 
GO
CREATE TABLE Клієнти  (
 Id varchar(10) not null,
 Прізвище nvarchar(50) not null,
 Імя nvarchar(50) not null,
 [По-батькові] nvarchar(50) not null,
 [Номер тел] char(13) not null,
 [Код типу] varchar(10) not null,
 [Email] varchar(50) not null,
 Constraint [унікальний емейл] Unique (Email),
 Constraint [унікальний тел.] Unique ([Номер тел]),
 constraint [клієнти первинний ключ] Primary Key  (Id),
 constraint [клієнт- тип клієнта] Foreign key([Код типу])
 References [Тип клієнта] (Id)
 On update cascade 
 On Delete cascade) 
 Go
 CREATE TABLE [Тип відділення](
Id varchar(10) not null,
[Назва] nvarchar(50) NOT NULL,
[Опис] nvarchar(150) null,
constraint [Тип відділення первинний ключ] Primary Key  (Id),
constraint [перевірка типів] check  ([Назва] in ('Мале', 'Середнє', 'Велике'))
)
GO
CREATE TABLE Відділення (
[Id] varchar(10) NOT NULL,
[Id типу] varchar(10) NOT NULL,
[Область] nvarchar(50) NOT NULL,
[Місто] nvarchar(50) NOT NULL,
[Адреса] nvarchar(50) NOT NULL,
[Номер тел] char(13) not null,
constraint[відділення первинний ключ] Primary Key (Id),
constraint "відділення - тип" Foreign key([Id типу])
References [Тип відділення] (Id)
On update cascade 
On Delete cascade) 
Go 
CREATE TABLE [Працівники](
[Id]  varchar(10) NOT NULL,
[Прізвище] nvarchar(50) NOT NULL,
[Імя] nvarchar(50) NOT NULL,
[По-батькові] nvarchar(50) NOT NULL,
[Номер тел] char(13) not null,
Constraint [унікальний тел] Unique ([Номер тел]),
Constraint[працівники первинний ключ] Primary Key (Id))
GO
CREATE TABLE [Упаковка](
[Id]  varchar(10) NOT NULL,
[Назва] nvarchar(50) NOT NULL,
[Опис] nvarchar(150) null,
constraint [упаковка первинний ключ] Primary Key  (Id))
GO
CREATE TABLE Постачальники (
Id varchar(10) NOT NULL ,
Назва nvarchar(50) NOT NULL,
Адреса nvarchar(50) NOT NULL,
Email varchar(50) NOT NULL,
[Номер тел] char(13) not null,
CONSTRAINT [Постачальники первинний ключ] PRIMARY KEY (Id),
CONSTRAINT [унікальний емейл пост] UNIQUE (Email),
CONSTRAINT [унікальний тел пост] Unique ([Номер тел]))
go   
CREATE TABLE [Замовлення упаковки](
Id  int identity (1,1),
[Id постачальника] varchar(10) NOT NULL,
[Id упаковки]  varchar(10) NOT NULL,
Дата  datetime NOT NULL,
Ціна float not null,
Кількість int not null, 
CONSTRAINT [Замовлення упаковки первинний ключ] PRIMARY KEY (Id),
CONSTRAINT "Замовлення упаковки - постачальники" Foreign key([Id постачальника])
references Постачальники (Id)
On update cascade 
On Delete cascade,
CONSTRAINT "Замовлення упаковки - упаковка" Foreign key([Id упаковки])
references [Упаковка] (Id)
On update cascade 
On Delete cascade)
go