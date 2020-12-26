drop database if exists construct_shop;

create database construct_shop;

use construct_shop;

create table departaments(
id int not null primary key auto_increment,
name varchar(30) not null);

create table deposits(
id int not null primary key auto_increment,
city varchar(30) not null,
address varchar(40) not null);

create table drills(
id int not null primary key auto_increment,
name varchar(20) not null,
mark varchar(20) not null,
battery tinyint null,
price int not null,
stock int not null,
departaments_id int not null,
constraint fk_drills_departaments
foreign key (departaments_id)
references departaments(id));

create table cements(
id int not null primary key auto_increment,
name varchar(20) not null,
granulation varchar(30) not null,
price int not null,
stock int not null,
departaments_id int not null,
constraint fk_cements_departaments
foreign key (departaments_id)
references departaments(id));

 create table paints(
 id int not null primary key auto_increment,
 name varchar(20) not null,
 mark varchar(20) not null,
 color varchar(20) not null,
 price int not null,
 stock int not null,
 departaments_id int not null,
 constraint fk_paints_departaments
 foreign key (departaments_id)
 references departaments(id));
 
 create table valves(
 id int not null primary key auto_increment,
 name varchar(20) not null,
 mark varchar(20) not null,
 price int not null,
 stock int not null,
 departaments_id int not null,
 constraint fk_valves_departaments
 foreign key (departaments_id)
 references departaments(id));
 
 
 create table users_registration(
 id int not null primary key auto_increment,
 name varchar(20) not null,
 surname varchar(20) not null,
 phone_number varchar(20),
email varchar (40) not null,
 password varchar(40) not null,
 orders_number varchar(20) not null);
 
 create table employees(
 id int not null primary key auto_increment,
 name varchar(20) not null,
 surname varchar(20) not null,
 age int not null,
 departaments_id int not null,
 constraint fk_employees_departaments
 foreign key (departaments_id)
 references departaments(id),
 deposits_id int not null,
 constraint fk_employees_deposits
 foreign key (deposits_id)
 references deposits(id));

create table drills_deposits(
id int not null primary key auto_increment,
drills_id int not null,
constraint fk_drills_deposits foreign key (deposits_id) references deposits(id),
deposits_id int not null,
constraint fk_deposits_drills foreign key (drills_id) references drills(id));

create table cements_deposits(
id int not null primary key auto_increment,
cements_id int not null,
constraint fk_cements_deposits foreign key (deposits_id) references deposits(id),
deposits_id int not null,
constraint fk_deposits_cements foreign key (cements_id) references cements(id));

create table paints_deposits(
id int not null primary key auto_increment,
paints_id int not null,
constraint fk_paints_deposits foreign key (deposits_id) references deposits(id),
deposits_id int not null,
constraint fk_deposits_paints foreign key (paints_id) references paints(id));

create table valves_deposits(
id int not null primary key auto_increment,
valves_id int not null,
constraint fk_valves_deposits foreign key (deposits_id) references deposits(id),
deposits_id int not null,
constraint fk_deposits_valves foreign key (valves_id) references valves(id));
