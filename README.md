# MovieNow Movie rentals Analysis.

https://tidbits.com/uploads/2019/04/Rentals-6.jpg

## INTRODUCTION

**MovieNow** is an online movie rental company with a database about customer information, movie ratings, background 
information on actors and more. The Database contain 5 tables namely: Actors, Actsin, Customers, Movies and renting.
I came acorss the data while I was taking a Datacamp Course. I have attached the Database file in the repo.

## Problem Statement

MovieNow wish to make informed decisions about which movies to add to their inventory, which actors are the most popular, 
and which genres are the most in demand. Additionally, the rental data could be used to optimize
rental policies to maximize customer satisfaction and revenue.

## Skills/ Concept demostrated 
I’m using Postgresql for this analysis and these are the functions used.

- Aggregate functions — SUM, COUNT, SUM, AVERAGE 
- Joins — left join
- Subqueries
- OLAP 
- Common Table Expession (CTE)
- Windows function

MovieNow wants us to answer the following questions

## Questions
1. How much income did each movie generate?
2. which genres are the most in demand
3. Top 5 highest spending customer and the number of times they patronized MovieNow
4. How much money is spent on rentals by each Customer?
5. what is the total number of movie rentals, the average rating of all movies and the total revenue for each country since the beginning of 2019
6. who is the best male actor by average ratings and most watch
7. Which is the favorite movie on MovieNow for a specific group of customers: for all customers born in the 70s.
8. Who is the most popular actor in spain
9. Prepare a table for a report about the national preferences of the customers from MovieNow comparing the average rating of movies across countries and genres.
10. what year did MovieNow make more money?

## Insight

1. The movies "Bridget Jones - The Edge of Reason," "Fair Game," "The Kingdom," "Two for the Money," and "Django Unchained" earned the highest revenues of 37.57, 34.68, 31.35, 30.69, and 29.59, respectively.
2. Drama is the most demanded genre, it was demanded 319 times and made a total of $689.11 as revenue
3. Our top-spending customers are Avelaine Corbeil, Lucy Centeno Barrios, Havasy Kristof, and Canela Gaona Lozano, with total expenditures of $31.56, $31.45, $30.37, and $24.29, respectively. Saúl Tafoya Meraz and Fiacre Montminy are also among our highest spenders, each having spent a total of $24.00 and visited MovieNow 10 times.
4. In terms of movie rentals, Italy has recorded the highest figure of 30 since the start of 2019, with a total revenue of $69.90.
5. Christian Bale is the best male actor with an average rating of 10 
6. MovieNow's favorite movies from the 70s are "Django Unchained" and "The Fighter"  with both films having been rented 10 times and receiving an average rating of 10.
7. Spain's most popular actress is Catherine Keener, while the most popular actors are Emma Watson, Daniel Radcliffe, and Rupert Grint, with an average rating of 7.60 each and 7 views for each of their films.
8. The year with the highest revenue for MovieNow was 2018, with a total of $658.02 in earnings.
  

https://www.pexels.com/photo/thank-you-lettering-on-white-surface-4439457/
Thank you for following through. 
