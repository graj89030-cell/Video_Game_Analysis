CREATE DATABASE video_game_db;
use video_game_db;

create table games (id int auto_increment primary key,
 tittle varchar(255), 
 release_date date, 
 team varchar(255), 
 rating float, 
 times_listed int, 
 number_of_reviews int, 
 genres varchar(100),
 plays int,
 playing int, 
 backloga int,
 wiahlist int
 );
 select * from games;
 
 CREATE TABLE vgsales (
    rank_id INT,
    name VARCHAR(255),
    platform VARCHAR(50),
    year INT,
    genre VARCHAR(50),
    publisher VARCHAR(100),
    na_sales FLOAT,
    eu_sales FLOAT,
    jp_sales FLOAT,
    other_sales FLOAT,
    global_sales FLOAT
);
select * from games;

show databases;
use video_game_db;
show tables;
select count(*) from games;
select count(*) from sales;
select * from games;

rename table vgsales  to Sales;



---- 1.check_data
select * from games limit 10;
select * from sales limit 10;


---- 2.Basic Analysis
select count(*) as total_games from games;

---- game per years 
select year(release_date) as year,
count(*) as total_game
from games 
group by year
order by year;
---- "Games increased over time"


---- 3.Genre Analysis
select genres, count(*) as total
from games 
group by genres
order by total desc limit 10;
---- "Most Popular genre is ADVENTURE"


---- 4.Top Rated Games
select tittle, rating
from games 
order by rating desc
limit 10;


---- 5.Most Reviewed Games
select tittle, Number_of_reviews
from games
order by number_of_reviews desc
limit 10;


---- 6.Sales Analysis(Important)
select year, sum(global_sales) as total_sales
from sales
group by year 
order by year;
---- "Sales increased/decreased over years"


---- 7.Top Selling Games
select name,global_sales
from sales
order by global_sales desc
limit 10;


---- 8.Platform-Wise Sales
select platform,sum(global_sales) as total_sales
from sales
group by platform
order by total_sales desc;


---- 9.Genre-Wise Sales
select genre, sum(global_sales) as total_sales
from sales
group by genre
order by total_sales desc;

---- Join_Both_Tables
select g.tittle, g.rating, s.global_sales
from games g
join sales s on 
g.tittle = s.name;
---- "Compare Rating VS Sales"

/* INSIGHT 

The number of games increased over time
Action genre is the most popular
Some games have high sales despite average ratings
Weak relationship between rating and popularity
*/

/*
Conclusion:

The project combines Python and SQL for effective data analysis.
Python was used for data cleaning, visualization, and exploratory analysis, 
while SQL was used to validate and support the insights obtained.
The results from SQL queries confirmed the trends observed in Python, 
ensuring accuracy and reliability.
*/





