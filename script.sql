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

);

create table manager(
    id int not null primary key auto_increment,
    first_name varchar(255),
    last_name varchar(255),
    job_position int,
    foreign key (job_position)
    references  job_position(id)
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
);


insert into job_position(name_of_job_position, job_position_description)
values ('java developer', 'Designing and developing high-volume, low-latency applications for mission-critical systems and delivering high-availability and performance'),
       ('php developer','Writing of PHP scripts and coding to create or modify software and applications according to a clients needs');
 ;

insert into employee(first_name, last_name, email, personal_identification_number, phone_number, job_position)
values('Ana','Anić','asas@gmail.com','0123456789','000122322',1),
       ('Iva','Ivić','hjhj@yahoo.com','123145786','03200000',2);

insert into manager(first_name, last_name, job_position)
values('Ivo','Ivić',1),
       ('Marko','Marković',2);

insert into team(name_of_team, job_position, manager)
values('java team', 1, 1),
      ('php team', 2, 2);


insert into project(name_of_project, description_of_project, starting_date, ending_date, completed, team)
values ('java project', 'creating java applications', '19.10.2020','12.12.2020',false,1) ,
       ('php project', 'creating php applications','17.3.2020','01.09.2020',true,2);

