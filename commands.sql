create table teachers (id int not null primary key auto_increment, 
	name varchar(255) not null, last_name varchar(255));

create table students (id int not null primary key auto_increment,
	name varchar(255)not null, last_name varchar(255) not null,
	date_birth date, gender varchar(255), id_t int,
	constraint fk_teachers_students foreign key (id_t) references teachers(id));

create table courses (id int not null primary key auto_increment, 
	name varchar(255) not null);

create table students_courses (id int not null primary key auto_increment,
	id_s int, id_c int,
	constraint fk_students_1 foreign key (id_s) references students(id),
	constraint fk_courses_1 foreign key (id_c) references courses(id));

create table laptops (id int not null primary key auto_increment, 
	name varchar(255) not null, id_s int, unique key uid(id_s),
	constraint fk_loptops_students foreign key (id_s) references students(id));


insert into teachers values(null, "Ali", "Ibn Ahmad"), 
	(null, "Nurseit", "Omonaleev"),
	(null, "Nurizat", "Satybekova");

insert into students values(null, "Aisana", "Mirlan kyzu", '2001-05-14', "F", 2),
	(null, "Eldar", "Rysbekov", '1995-10-09', "M", 2),
	(null, "Kanykey", "Nasakeeva", '1999-04-18', "F", 2),
	(null, "Nursultan", "Chushtukov", '2000-03-26', "M", 2),
	(null, "Erjan", "Ruslan uulu", '2002-12-27', "M", 1),
	(null, "Bermet", "Sadykova", '1996-06-03', "F", 1),
	(null, "Daneel", "Andashpekov", '1998-09-14', "M", 1),
	(null, "Saikal", "Mamanova", '2002-11-17', "F", 1),
	(null, "Nurlan", "Kubatbekov", '2000-07-06', "M", 3),
	(null, "Adina", "Nurmanova", '2001-01-18', "F", 3);

insert into courses values(null, "Python"), (null, "Front-end"), (null, "Java");

insert into students_courses values(null, 1,1),(null, 2,1),(null, 3,1),(null, 4,1),(null, 5,1),
(null, 6,1),(null, 7,1),(null, 8,1),(null, 9,1),(null, 10,1),
(null, 1,2),(null, 2,2),(null, 3,2),(null, 4,2),(null, 5,2),
(null, 6,2),(null, 7,2),(null, 8,2),(null, 9,2),(null, 10,2),
(null, 1,3),(null, 2,3),(null, 3,3),(null, 4,3),(null, 5,3),
(null, 6,3),(null, 7,3),(null, 8,3),(null, 9,3),(null, 10,3);

insert into laptops values(null, "Asus", 1), (null, "Acer", 2),	(null, "Hp", 3),(null, "Dell", 4),
	(null, "Macbook", 5), (null, "Lenova", 6), (null, "Lenova", 7), (null, "Acer", 8),
	(null, "Hp", 9),(null, "Dell", 10);


select * from students where year(date_birth) < 2000 and gender = "M";

select name, last_name from students union select name, last_name from teachers;

select students.name, students.last_name from students
	join teachers on students.id_t = teachers.id where teachers.name = "Ali";

select students.name, last_name,courses.name from students 
	join students_courses on students.id = id_s 
	join courses on courses.id = id_c;

select * from students where to_days(date_birth)> 730485;

select gender , count(gender) as count from students group by gender;

select year(date_birth) as year, count(*)as count from students 
	where year(date_birth)>1997 group by year(date_birth);

select name, count(name) as count from students 
	where gender = "F" group by name;