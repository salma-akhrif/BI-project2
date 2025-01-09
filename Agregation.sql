CREATE VIEW film_count_by_category AS
SELECT category_name, COUNT(film_id) AS film_count
FROM sakila_combined
GROUP BY category_name;

CREATE VIEW total_revenue_per_film AS
SELECT film_title, SUM(payment_amount) AS total_revenue
FROM sakila_combined
GROUP BY film_title;

CREATE VIEW average_revenue_per_film AS
SELECT film_title, AVG(payment_amount) AS average_revenue
FROM sakila_combined
GROUP BY film_title;

CREATE VIEW rental_count_per_customer AS
SELECT customer_name, COUNT(rental_id) AS rental_count
FROM sakila_combined
GROUP BY customer_name
ORDER BY rental_count DESC;

CREATE VIEW payment_distribution_by_country AS
SELECT 
    store_country AS country,  
    SUM(payment_amount) AS total_payment
FROM 
    sakila_combined
GROUP BY 
    store_country
ORDER BY 
    total_payment DESC;
    
CREATE VIEW rental_duration_statistics AS
SELECT 
    MIN(DATEDIFF(return_date, rental_date)) AS min_duration,
    MAX(DATEDIFF(return_date, rental_date)) AS max_duration,
    AVG(DATEDIFF(return_date, rental_date)) AS average_duration
FROM 
    sakila_combined
WHERE 
    rental_date IS NOT NULL AND return_date IS NOT NULL;
    
CREATE VIEW rentals_per_year AS
SELECT 
    YEAR(rental_date) AS rental_year, 
    COUNT(*) AS total_rentals
FROM sakila_combined
GROUP BY 
    rental_year
ORDER BY 
    rental_year;

CREATE VIEW rentals_per_month AS
SELECT 
    MONTH(rental_date) AS rental_month, 
    COUNT(*) AS total_rentals
FROM 
    sakila_combined
GROUP BY 
    rental_month
ORDER BY 
    rental_month;
    
CREATE VIEW rentals_per_film_length AS
SELECT 
    film_length, 
    COUNT(rental_id) AS total_rentals
FROM 
    sakila_combined
GROUP BY 
    film_length
ORDER BY 
    film_length DESC,total_rentals DESC;
    
CREATE VIEW rental_by_length_category_combined AS
SELECT 
    CASE 
        WHEN sc.film_length < 60 THEN 'Court '
        WHEN sc.film_length >= 60 AND sc.film_length < 100 THEN 'Moyen '
        WHEN sc.film_length >= 100 THEN 'Long '
    END AS length_category,
    COUNT(sc.rental_id) AS total_rentals
FROM 
    sakila_combined sc
GROUP BY 
    length_category
ORDER BY 
    total_rentals DESC;
    
CREATE VIEW rental_by_category AS
SELECT 
    sc.category_name,
    COUNT(sc.rental_id) AS total_rentals
FROM 
    sakila_combined sc
GROUP BY 
    sc.category_name
ORDER BY 
    total_rentals DESC;

CREATE VIEW customers_per_category AS
SELECT 
    sc.category_name,
    COUNT(DISTINCT sc.customer_id) AS total_customers
FROM 
    sakila_combined sc
GROUP BY 
    sc.category_name
ORDER BY 
    total_customers DESC;








