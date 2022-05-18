use albums_db;
show create table albums;

-- CREATE TABLE `albums` (
--   `id` int unsigned NOT NULL AUTO_INCREMENT,
--   `artist` varchar(240) DEFAULT NULL,
--   `name` varchar(240) NOT NULL,
--   `release_date` int DEFAULT NULL,
--   `sales` float DEFAULT NULL,
--   `genre` varchar(240) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1

select count(*)  from albums;
-- shows how many rows are in the albums table

select count(distinct(artist)) from albums;
-- --shows how many unique artists are in the table-- 

-- the primary key for the albums table is the id column which is an unsigned integer

select * from albums order by release_date DESC;

-- takes the table and orders by release date in descending order
--  the oldest release date in 1967 and the newest is 2011

select * from albums where artist='Pink Floyd';
-- name of all albums by pink floyd

select * from albums where name = "Sgt. Pepper's Lonely Hearts Club Band";
-- information on album named sgt peppers lonely hearts club band

select * from albums where name = "Nevermind";
-- info on album named nevermind

select name from albums where release_date between 1990 and 2000;
-- shows which albums were released between 1990 and 2000

select * from albums where sales < 20;
-- shows which records were released with sales less than 20 (million)

select * from albums where genre = "Rock";
-- shows rock genre records but do not include progressive or hard rock based on the string query used

select * from albums where genre = "Rock" or "% rock";

