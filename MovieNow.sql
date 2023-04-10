SELECT * FROM actors limit 5;
SELECT * FROM actsin limit 5;
SELECT * FROM customers limit 5;
SELECT * FROM movies limit 5;
SELECT * FROM renting;

--How much income did each movie generate?
SELECT m.title, sum(m.renting_price) AS movie_income
FROM renting AS r
INNER JOIN movies AS m
USING(movie_id)
GROUP BY m.title
ORDER BY movie_income DESC;

-- which genre are most in demand

SELECT m.genre,
	   COUNT(r.renting_id) AS times_rented,
	   SUM(m.renting_price) AS total_revenue
FROM renting AS r
LEFT JOIN movies AS m
USING(movie_id)
GROUP BY m.genre
ORDER BY times_rented DESC;

-- Top 5 highest spending customer and the number of times they patronized MovieNow

WITH customer_ranking AS (
SELECT c.name,
	   sum(m.renting_price) AS total_spent,
	   COUNT(*) AS times_patronized,
RANK()OVER(ORDER BY SUM(m.renting_price) DESC) AS rank
FROM renting AS r
LEFT JOIN movies AS m
USING(movie_id)
LEFT JOIN customers AS c
USING(customer_id)
GROUP BY c.name, r.customer_id
) 

SELECT name, total_spent, times_patronized, rank
FROM customer_ranking
WHERE rank <= 5;


-- How much money is spent on rentals by each Customer?
SELECT rm.customer_id,
	   SUM(rm.renting_price) AS amount_spent
FROM
	(SELECT r.customer_id,
			m.renting_price
	FROM renting AS r
	LEFT JOIN movies AS m
	USING(movie_id)) AS rm
GROUP BY rm.customer_id
ORDER BY amount_spent DESC;

/*what is the total number of movie rentals, the average rating of all movies and the total revenue 
for each country since the beginning of 2019.*/

SELECT 
	c.country,                   
	COUNT(*) AS number_renting,
	AVG(r.rating) AS average_rating,
	SUM(m.renting_price) AS revenue       
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE date_renting >= '2019-01-01'
GROUP BY country
ORDER BY revenue DESC, average_rating DESC;


--Which is the favorite movie on MovieNow for a specific group of customers: for all customers born in the 70s.
SELECT m.title, 
	   COUNT(*) AS times_rented,
	   ROUND(AVG(r.rating), 2) AS avg_rating
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE c.date_of_birth BETWEEN '1970-01-01' AND '1979-12-31'
GROUP BY m.title
HAVING COUNT(*) > 1
AND AVG(r.rating) IS NOT NULL
ORDER BY avg_rating DESC;

-- Who is the most popular actor in spain

SELECT a.name,  c.gender,
       COUNT(*) AS number_views, 
       ROUND(AVG(r.rating), 2) AS avg_rating
FROM renting as r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
LEFT JOIN actsin as ai
ON r.movie_id = ai.movie_id
LEFT JOIN actors as a
ON ai.actor_id = a.actor_id
WHERE c.country = 'Spain'
GROUP BY a.name, c.gender
HAVING AVG(r.rating) IS NOT NULL 
  AND COUNT(*) > 5 
ORDER BY avg_rating DESC, number_views DESC;

/*Prepare a table for a report about the national preferences of the customers
from MovieNow comparing the average rating of movies across countries and genres.*/

SELECT 
	country, 
	genre, 
	AVG(r.rating) AS avg_rating
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY CUBE(country, genre);

-- what year did MovieNow make more money?

SELECT EXTRACT(YEAR FROM date_renting) AS year,
		SUM(m.renting_price) AS amount
FROM renting AS r
LEFT JOIN movies AS m
USING(movie_id)
GROUP BY year
ORDER BY amount DESC
