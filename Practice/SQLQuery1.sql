create table Employees(

[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Surname] nvarchar(50) not null,
[Email] nvarchar(100) unique

)

select * from Employees

insert into Employees([Name],[Surname],[Email])
values('Agshin','Valiyev','agshin@mail.ru'),
	  ('Semed','Huseynov','semed@mail.ru'),
	  ('Ilham','Abasli','ilham@mail.ru'),
	  ('Cavad','Bekirli','cavad@mail.ru'),
	  ('Nurlan','Musayev','nurlan@mail.ru')


alter table Employees add default 'XXX' for [Surname]

insert into Employees([Name],[Email])
values('Oruc','oruc@mail.ru')

alter table Employees
add Age int check (Age>18)


insert into Employees([Name],[Email],[Age])
values('Hesen','hesen@mail.ru',19)

select count(*) as 'Employees count' from Employees

select sum(Age) as 'Employees age sum' from Employees

select avg(Age) as 'Employees age avg' from Employees

select max(Age) as 'Employees age max' from Employees

select min(Age) as 'Employees age min' from Employees

select substring ('Aqshin bey',1,3)

select replace ('Salamlar','s','k')


select substring([Surname],1,4) from Employees


declare @avgAge int = (select AVG(Age) from Employees)

declare @sumAge int = (select SUM(Age) from Employees)

if @sumAge > @avgAge
	print 'Yes'
else
	print 'No'


use Practice



create table Countries(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50)
)

insert into Countries([Name])
values('Azerbaycan'),
	  ('Turkiye'),
	  ('Ispaniya'),
	  ('Almaniya')


select * from Countries

create table Cities(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[CountryId] int,
	foreign key (CountryId) references Countries(Id)
)

select * from Cities

insert into Cities([Name],[CountryId])
values('Baku',1),
	  ('Agshu',1),
	  ('Shusha',1),
	  ('Antalya',2),
	  ('Madrid',3),
	  ('Barcelona',3),
	  ('Berlin',4),
	  ('Hamburg',4)


select * from Cities where CountryId = 1



create table Students(
	[Id] int primary key identity(1,1),
	[Fullname] nvarchar(100) not null,
	[Email] nvarchar(100),
	[Address] nvarchar(100),
	[Age] int,
	[CityId] int,

	foreign key (CityId) references Cities(Id)
)

insert into Students([Fullname],[Email],[Address],[Age],[CityId])
values ('Agshin Valiyev','agshin@mail.ru','razin',26,1),
	   ('Nurlan Musayev','nurlan@mail.ru','nerimanov',21,1),
	   ('Metanet Abbasova','metanet@mail.ru','sumqayit',25,2),
	   ('Semed Huseynov','semed@mail.ru','ehmedli',27,2),
	   ('Ilham Abasli','ilham@mail.ru','lokbatan',20,3),
	   ('Cavad Bekirli','cavad@mail.ru','7mkr',32,4),
	   ('Meryem Eliyeva','meryem@mail.ru','dernegul',2,3)

select * from Students


create table Teachers(
	[Id] int primary key identity(1,1),
	[Fullname] nvarchar(100),
	[Salary] float,
	[Age] int,
	[CityId] int,
	foreign key (CityId) references Cities(Id)
)


create table TeacherStudents(
	[Id] int primary key identity(1,1),
	[TeacherId] int,
	[StudentId] int,
	foreign key (TeacherId) references Teachers(Id),
	foreign key (StudentId) references Students(Id)
)


select ct.Name as 'City',co.Name as 'Country' from Countries co
join Cities ct
on co.Id = ct.CountryId

select co.Name as 'Country',ct.Name as 'City' from Countries co
left join Cities ct
on co.Id = ct.CountryId

select co.Name as 'Country',ct.Name as 'City' from Countries co
right outer join Cities ct
on co.Id = ct.CountryId

select co.Name as 'Country',ct.Name as 'City' from Countries co
full outer join Cities ct
on co.Id = ct.CountryId

select st.Fullname as 'Student fullname', st.Email as 'Student email', st.age as 'Student age', ct.Name as 'City', co.Name as 'Country' from Students st
join Cities ct
on ct.Id = st.CityId
join Countries co
on ct.CountryId = co.Id
order by st.Age desc

