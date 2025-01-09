use sakila_combined_db;
select * from sakila_combined;
SELECT *
FROM sakila_combined
WHERE film_id IS NULL
   OR film_title IS NULL
   OR film_description IS NULL
   OR release_year IS NULL
   OR rental_rate IS NULL
   OR film_length IS NULL
   OR category_name IS NULL
   OR customer_id IS NULL
   OR customer_name IS NULL
   OR customer_email IS NULL
   OR staff_id IS NULL
   OR staff_name IS NULL
   OR store_id IS NULL
   OR store_city IS NULL
   OR store_country IS NULL
   OR rental_id IS NULL
   OR rental_date IS NULL
   OR return_date IS NULL
   OR payment_amount IS NULL;
select count(*) from sakila_combined ;
select * from sakila_combined;
select count(customer_id) from sakila_combined where return_date is null;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM sakila_combined
WHERE return_date IS NULL;
select count(customer_id) from sakila_combined where return_date is null;
SELECT *
FROM sakila_combined
GROUP BY film_id, film_title, film_description, release_year, rental_rate, film_length,
         category_name, customer_id, customer_name, customer_email, staff_id, staff_name,
         store_id, store_city, store_country, rental_id, rental_date, return_date, payment_amount
HAVING COUNT(*) > 1;

