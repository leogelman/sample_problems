create database if not exists movielense;
use movielense

drop table if exists movie_genre;
create table movie_genre (genre varchar(128), movieid int, primary key(genre, movieid));
load data local infile './data/movies_norm.csv' into table movie_genre fields terminated by ',' ignore 1 lines;

drop table if exists genre;
create table genre (genre varchar(128), primary key (genre));
load data local infile './data/genre.csv' into table genre fields terminated by ',';

