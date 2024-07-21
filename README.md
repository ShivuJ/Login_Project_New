To Create Database please excute the following queries:

create database login;

use login;

create table login (
	id int primary key auto_increment,
    name varchar(30),
    email varchar(100) unique,
    password varchar(100)
);

select * from login;
