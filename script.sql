drop DATABASE if exists project_management;
CREATE DATABASE project_management CHARACTER SET utf8mb4 COLLATE
utf8mb4_unicode_ci;

use project_management;

create table job_position(
    id int not null primary key auto_increment,
    name_of_job_position varchar(255),
    job_position_description varchar(255)

);
create table employee(
    id int not null primary key auto_increment,
    first_name varchar(255),
    last_name varchar(255),
    email varchar(255),
    personal_identification_number varchar(255),
    phone_number varchar(255),
     job_position int,
     foreign key (job_position) references job_position(id)
     ON DELETE CASCADE
);

create table manager(
    id int not null primary key auto_increment,
    employee int,
    foreign key (employee)
    references  employee(id)
    ON DELETE CASCADE
);

create table  team(
    id int not null primary key auto_increment,
    name_of_team varchar(255),
    job_position int,
    foreign key (job_position)
    references  job_position(id),
    manager int,
    foreign key (manager)
    references manager(id)
   ON DELETE CASCADE
);

create table project(
    id int not null primary key auto_increment,
    name_of_project varchar(255),
    description_of_project varchar(255),
    starting_date date,
    ending_date date,
    completed tinyint,
    team int,
    foreign key (team)
    references team(id)
        ON DELETE CASCADE
);

/*inserting values in tables */

insert into job_position(name_of_job_position, job_position_description)
values ('java developer', 'Designing and developing high-volume, low-latency applications for mission-critical systems and delivering high-availability and performance'),
       ('php developer','Writing of PHP scripts and coding to create or modify software and applications according to a clients needs'),
       ('project manager','Responsible for planning and overseeing projects to ensure they are completed in a timely fashion and within budget.'),
       ('QA','Designing and implementing tests, debugging and defining corrective actions.'),
       ('Design','Illustrates concept by designing rough layout of art and copy regarding arrangement, size, type size and style, and related aesthetic concepts.')
 ;

insert into employee(first_name, last_name, email, personal_identification_number, phone_number, job_position)
values('Ana','Anić','asas@gmail.com','0123456789','000122322',1),
       ('Ivo','Ivić','hjhj@yahoo.com','123145786','03200000',2),
       ('Teo','Teić','hjhkh@gmail.com','0125634789','0220000',3),
      ('Marko','Marković', 'oojj@gmail.com','0125635852','0220001',3),
       ('Maja','Majić','hjhj@gmail.com','789456123','1234567',4),
       ('Edo','Edić','hjgjgj@gmail.com','078451263','0789456',5);


insert into manager(employee)
values(3),
       (4);



insert into team(name_of_team, job_position, manager)
values('team 1', 1, 1),
      ('team 2', 2, 2),
       ('team 3', 4, 1),
       ('team 4', 5, 2);


insert into project(name_of_project, description_of_project, starting_date, ending_date, completed, team)
values ('java project', 'creating java applications', '2020-10-19','2020-12-12',false,1) ,
       ('php project', 'creating php applications','2020-03-17','2020-09-01',true,2);

/* five updates */

update employee set email='tztztzt@gmail.com' where first_name='Ana';
update employee set first_name='Mijo', last_name='Mijić' where id=2;
update team set job_position= 1 where name_of_team='team 4';
update project set ending_date ='2020-11-30' where id=1;
update employee set phone_number='12555513' where email='hjhj@yahoo.com';

/*10 select statements*/
/*1. select number of employees*/
select COUNT(id) from employee;
/*2. select project that starts first*/
select MIN(starting_date), name_of_project from project;
/*3. select project that ends last*/
select MAX(ending_date),name_of_project from project;
/*4.select how many projects are completed*/
select SUM(completed) from project where completed=true;
/*5.select how many employees have name Ana*/
select COUNT(first_name) from employee where first_name='Ana';
/*6.select first and last name of employee and their job positions*/
select e.first_name,e.last_name, j.name_of_job_position from job_position j inner join employee e  on j.id = e.job_position;
/*7. select all data from manager with id =1*/
select * from employee e left join manager m on e.id = m.employee where m.id=1;
/* 8.select all projects and teams that work on them*/
select p.name_of_project,t.name_of_team from project p inner join team t on p.team = t.id;
/*9.select all data from employees and all data from job position */
select * from job_position cross join employee e on job_position.id = e.job_position;
/*10. how many teams are on php project*/
select COUNT(t.id) from team t inner join project p on t.id = p.team where name_of_project='php project';
/*11. select all first and last name of employee which last name starts with Ma*/
select * from employee where last_name like 'Ma%';

/* 5 deletes*/
delete from employee where first_name='Edo';
delete from team where name_of_team ='team 4';
delete from employee where id=4;
delete from manager where  id=2;
delete from project where id=2;