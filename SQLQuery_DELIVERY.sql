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
