-- Question 1: List all customers who live in texas
-- hint, use JOIN's
SELECT customer.first_name, customer.last_name, district 
FROM customer 
JOIN address 
ON address.address_id = customer.address_id 
WHERE address.district = 'Texas';

-- Question 2: Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount 
FROM customer 
JOIN payment 
ON payment.customer_id = customer.customer_id 
WHERE payment.amount > 6.99;

-- Question 3: Show all customers who have made payments over $175 (use subqueries)
SELECT *
FROM customer 
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING sum(amount) >175
)

-- Recieve help in class

-- Question 4: List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, city 
FROM customer 
JOIN address 
ON customer.address_id = address.address_id 
JOIN city 
ON address.city_id = city.city_id 
WHERE city.city = 'Nepal';
-- No one lives in Nepal...
SELECT first_name, last_name, city 
FROM customer 
JOIN address 
ON customer.address_id = address.address_id 
JOIN city 
ON address.city_id = city.city_id 
WHERE city.city = 'London';

-- Question 5: Which staff member had the most transactions
-- rentals?
SELECT first_name, last_name, count(rental.rental_id)
FROM staff 
JOIN rental 
ON staff.staff_id = rental.staff_id
GROUP BY first_name, last_name;
-- Check if solution is correct

-- Question 6: How many movies of each rating are there?
SELECT count(title), rating
FROM film 
GROUP BY rating;

-- Question 7: Show all customers who have made a single payment above 6.99(user subqueries)

SELECT first_name, last_name, amount
FROM customer 
JOIN payment 
ON customer.customer_id = payment.customer_id 
WHERE amount IN (
	SELECT amount
	FROM payment 
	WHERE 6.99 < amount
)

-- Question 8: How many free rentals did our stores give away?
SELECT count(amount)
FROM payment 
JOIN staff 
ON payment.staff_id = staff.staff_id 
JOIN store 
ON staff.store_id = store.store_id 
WHERE amount = 0;





