create table Students(
[Id] int primary key identity (1,1),
[Fullname] nvarchar(100) not null,
[Email] nvarchar(100) unique
)

insert into Students([Fullname],[Email])
values('Agshin Valiyev','agshin@mail.ru'),
	  ('Semed Huseynov','semed@mail.ru'),
	  ('Ilham Abasli','ilham@inbox.ru'),
	  ('Oruc Mehrabov','oruc@list.ru'),
	  ('Cavad Bekirli','cavad@gmail.com')


select * from Students

select SUBSTRING ([Email], 1, CHARINDEX( '@', [Email]) - 1) as 'Task2-1' from Students

select SUBSTRING ([Email], CHARINDEX( '@', [Email]) + 1,LEN([Email])) as 'Task2-2' from Students