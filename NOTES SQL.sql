select * FROM tb
WHERE x = 'mhd'

___________________

SELECT * 
FROM movies
WHERE year > 2014;

--Edit the query so that it will now retrieve all the recent movies, 
--specifically those that were released after 2014.

___________________

SELECT *
FROM movies
WHERE name LIKE 'se_en';

--How could we select all movies that start with ‘Se’ and end with ‘en’
--and have exactly one character in the middle?

____________________

SELECT * 
FROM movies
WHERE name LIKE 'A%';

--This statement below filters the result set to only include movies with
--names that begin with the letter ‘A’:

____________________

SELECT * 
FROM movies
WHERE name LIKE '%a';

--%a matches all movies that end with ‘a’

_____________________

SELECT * 
FROM movies
WHERE name LIKE 'The %';

--Edit the query so that it selects all the information about
--the movie titles that begin with the word ‘The’.

_____________________

SELECT name
FROM movies 
WHERE imdb_rating IS NULL;

--Write a query to find all the movies without an IMDb rating.

______________________

SELECT *
FROM movies
WHERE year BETWEEN 1970 AND 1979;

--Using the BETWEEN operator, write a new query that selects all
--information about movies that were released in the 1970’s.

___________________

SELECT *
FROM movies
WHERE year < 1985
 AND genre = 'horror';

--Using AND, write a new query that selects all movies made prior to 
--1985 that are also in the horror genre.

____________________

SELECT *
FROM movies
WHERE genre = 'comedy'
   OR genre = 'romance';
   
--Using OR, write a query that returns all movies that are either
--a romance or a comedy. 

_____________________

SELECT name, year, imdb_rating
FROM movies
ORDER BY imdb_rating DESC;

--Write a new query that retrieves the name, year, and imdb_rating columns of all
--the movies, ordered highest to lowest by their ratings.

_____________________

SELECT *
FROM movies
ORDER BY imdb_rating DESC 
LIMIT 3;

--Combining your knowledge of LIMIT and ORDER BY, write a query that returns the top 3 highest
--rated movies.

_____________________


--SELECT is the clause we use every time we want to query information from a database.
--AS renames a column or table.
--DISTINCT return unique values.
--WHERE is a popular command that lets you filter the results of the query based on conditions that you specify.
--LIKE and BETWEEN are special operators.
--AND and OR combines multiple conditions.
--ORDER BY sorts the result.
--LIMIT specifies the maximum number of rows that the query will return.
--CASE creates different outputs.


______________________

--first project called create table 
-- it involves how to create a table and to add different columns and values to it
--how to update and remove different values from the TABLE

CREATE TABLE friends( 
id INTEGER,
name TEXT, 
birthday DATE
);
INSERT INTO friends ( id, name, birthday ) VALUES(1, 'Mohammed', '1940-5-30');
INSERT INTO friends ( id, name, birthday ) VALUES(2, 'Ahmed', '1989-5-25');
INSERT INTO friends ( id, name, birthday ) VALUES(3, 'Mahmoud', '1990-7-6');
INSERT INTO friends ( id, name, birthday ) VALUES(4, 'Hamed', '1920-2-3');


UPDATE friends
SET name = 'STORM'
WHERE id = 2;

ALTER TABLE friends
ADD COLUMN email Text;

UPDATE friends
SET email = 'mohammed@gmail.com'
WHERE id = '1';

UPDATE friends
SET email = 'storm@gmail.com'
WHERE id = '2';

UPDATE friends
SET email = 'mahmoud@gmail.com'
WHERE id = '3';

UPDATE friends
SET email = 'hamed@gmail.com'
WHERE id = '4';

DELETE FROM friends
where id = 2;
SELECT * FROM friends;

_______________________________

SELECT * 
FROM nomnom
WHERE name LIKE  '%meatball%';

--Your coworker Trey can’t remember the exact name of a restaurant he went to but he knows it contains the word ‘meatball’ in it.
--Can you find it for him using a query?

_______________________________

SELECT * FROM nomnom 
WHERE health is null;


--Find all the health grade pending restaurants (empty values).


_______________________________

SELECT * FROM nomnom 
order by review desc
LIMIT = 10;

--Create a Top 10 Restaurants Ranking based on reviews.


_______________________________

SELECT name, review, 
CASE
 WHEN review > 4.5 THEN "Extraordinary"
 WHEN review > 4 THEN "Excellent"
 WHEN review > 3 THEN "Good"
 WHEN review > 2 THEN "Fair"
 else "Poor"
END AS 'Review'
FROM nomnom 


--Use a CASE statement to change the rating system to:
--review > 4.5 is Extraordinary
--review > 4 is Excellent
--review > 3 is Good
--review > 2 is Fair
--Everything else is Poor
--Don’t forget to rename the new column!

_______________________________

--1.Getting started, take a look at the startups table:

--2.Calculate the total number of companies in the table.

--3.We want to know the total value of all companies in this table.Calculate this by getting the SUM() of the valuation column.

--What is the highest amount raised by a startup?
--Return the maximum amount of money raised.
--5.Edit the query so that it returns the maximum amount of money raised, during ‘Seed’ stage.

--6.In what year was the oldest company on the list founded?

--7.Return the average valuation.

--8.Return the average valuation, in each category.

--9.Return the average valuation, in each category.Round the averages to two decimal places.

--10.Return the average valuation, in each category.Round the averages to two decimal places.Lastly, order the list from highest averages to lowest.

--What are the most competitive markets?

--11.First, return the name of each category with the total number of companies that belong to it.

--12.Next, filter the result to only include categories that have more than three companies in them.

--13.What is the average size of a startup in each location?

--14.What is the average size of a startup in each location, with average sizes above 500?

SELECT * FROM startups;
SELECT COUNT(*) FROM startups;
SELECT SUM(valuation) FROM startups;
SELECT MAX(raised)FROM startups
 WHERE stage = 'Seed';
 SELECT MIN(founded) FROM startups;
 SELECT AVG(valuation) FROM startups;
 SELECT ROUND(AVG(valuation), 2) FROM startups
 GROUP BY category
 ORDER BY AVG(valuation) DESC;
 SELECT category, count(*) FROM startups
 GROUP BY category
 HAVING COUNT(*) > 3;
 SELECT location, AVG(employees) FROM startups
 GROUP BY location
HAVING AVG(employees) > 500;

__________________________________________________

SELECT * FROM hacker_news;
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;
SELECT user, SUM(score)
FROM hacker_news
GROUP BY score
HAVING SUM(score) > 200;
SELECT AVG(score) FROM hacker_news;
SELECT user, url, COUNT(url)
FROM hacker_news
WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ' 
GROUP BY user
ORDER BY 3 DESC;
SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source',
  COUNT(url)
FROM hacker_news
GROUP BY 1;


SELECT 
 strftime('%H', timestamp) AS hours,
 ROUND(AVG(score)) AS average,
 COUNT(*) NUMBER
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;



________________________________________________________

--Start by performing a left join of newspaper table and online table on their id columns and selecting all columns.
--Add a second query after your first one that adds the following WHERE clause and condition:

--This will select rows where there was no corresponding row from the online table.

SELECT *
FROM newspaper
LEFT JOIN online
	ON newspaper.id = online.id;

SELECT *
FROM newspaper 
LEFT JOIN online
  ON newspaper.id = online.id
WHERE online.id IS NULL;

_______________________________________________________

--Let’s start by counting the number of customers who were subscribed to the newspaper during March.
--Use COUNT(*) to count the number of rows and a WHERE clause to restrict to two conditions:
--start_month <= 3
--end_month >= 3
--Select all columns from the cross join of newspaper and months.
--Create a third query where you add a WHERE statement to your cross join to restrict to two conditions:
--start_month <= month
--end_month >= month
--This will select all months where a user was subscribed.
--Create a final query where you aggregate over each month to count the number of subscribers.

SELECT COUNT(*)
FROM newspaper
WHERE start_month <=3 AND end_month >= 3;

SELECT * 
FROM newspaper
CROSS JOIN months;

SELECT *
FROM newspaper
CROSS JOIN months
WHERE start_month<= month
AND end_month >= month;

SELECT month, COUNT(*)
FROM newspaper
CROSS JOIN months
WHERE start_month <= month
AND end_month >= month
GROUP BY 1;

___________________________________________

--1.Let’s examine the three tables.
--SELECT * FROM trips;
--SELECT * FROM riders;
--SELECT * FROM cars;

--2.What’s the primary key of trips?
--what’s the primary key of riders?
--What’s the primary key of cars?

--3.Try out a simple cross join between riders and cars.

--4.Suppose we want to create a Trip Log with the trips and its users.
--Find the columns to join between trips and riders and combine the two tables using a LEFT JOIN.
--Let trips be the left table.

--5.Suppose we want to create a link between the trips and the cars used during those trips.
--Find the columns to join on and combine the trips and cars table using an INNER JOIN.

--6.The new riders data are in! There are three new users this month.
--Stack the riders table on top of the new table named riders2.
--Bonus: Queries and Aggregates

--7.What is the average cost for a trip?

--8.Lyft is looking to do an email campaign for all the irregular users.
--Find all the riders who have used Lyft less than 500 times!

--9.Calculate the number of cars that are active.

--10.It’s safety recall time for cars that have been on the road for a while.
--Write a query that finds the two cars that have the highest trips_completed.

SELECT * FROM trips;
SELECT * FROM riders;
SELECT * FROM cars;

SELECT * 
FROM riders
CROSS JOIN cars;

SELECT * 
FROM trips
LEFT JOIN riders
ON trips.id = riders.id;

SELECT * FROM trips
INNER JOIN cars
WHERE trips.id = cars.id;

SELECT * FROM riders
UNION
SELECT * FROM riders2;

SELECT  AVG(cost) as 'AVERAGE COST'
FROM trips;

SELECT * FROM RIDERS 
WHERE total_trips	< 500;

SELECT status,COUNT(status) FROM cars
WHERE status = 'active'
group by 1;

SELECT MAX(trips_completed) as 'maximum trips' 
FROM cars;

