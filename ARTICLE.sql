create database bot;
use bot;
create table users(id int auto_increment primary key, username varchar(45),email varchar(40),password varchar(40),phonenumber varchar(30),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
desc users;
select*from users;
CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author VARCHAR(100),
    title VARCHAR(255),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select*from articles;
create table admins(id int auto_increment primary key, username varchar(45),password varchar(40));
select*from admins;
insert into admins(username,password) values('admin','admin00');