-- Étape 1: Créeation une nouvelle base de données
CREATE DATABASE sakila_combined_db;

-- Utilisation la nouvelle base de données
USE sakila_combined_db;

-- Étape 2: Création une table combinée
CREATE TABLE sakila_combined (
    film_id INT,
    film_title VARCHAR(255),
    film_description TEXT,
    release_year YEAR,
    rental_rate DECIMAL(4, 2),
    film_length SMALLINT,
    category_name VARCHAR(255),
    customer_id INT,
    customer_name VARCHAR(255),
    customer_email VARCHAR(255),
    staff_id INT,
    staff_name VARCHAR(255),
    store_id INT,
    store_city VARCHAR(255),
    store_country VARCHAR(255),
    rental_id INT,
    rental_date DATETIME,
    return_date DATETIME,
    payment_amount DECIMAL(5, 2)
);

-- Étape 3: Insérertion les données combinées
INSERT INTO sakila_combined (
    film_id,
    film_title,
    film_description,
    release_year,
    rental_rate,
    film_length,
    category_name,
    customer_id,
    customer_name,
    customer_email,
    staff_id,
    staff_name,
    store_id,
    store_city,
    store_country,
    rental_id,
    rental_date,
    return_date,
    payment_amount
)
SELECT
    -- Informations sur le film
    f.film_id,
    f.title AS film_title,
    f.description AS film_description,
    f.release_year,
    f.rental_rate,
    f.length AS film_length,
    
    -- Catégorie du film
    c.name AS category_name,
    
    -- Informations sur le client
    cu.customer_id,
    CONCAT(cu.first_name, ' ', cu.last_name) AS customer_name,
    cu.email AS customer_email,
    
    -- Informations sur l'employé
    s.staff_id,
    CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
    
    -- Informations sur le magasin
    st.store_id,
    ci.city AS store_city,
    co.country AS store_country,
    
    -- Informations sur la location
    r.rental_id,
    r.rental_date,
    r.return_date,
    
    -- Paiement
    p.amount AS payment_amount
FROM
    sakila.film f
    JOIN sakila.film_category fc ON f.film_id = fc.film_id
    JOIN sakila.category c ON fc.category_id = c.category_id
    JOIN sakila.inventory i ON f.film_id = i.film_id
    JOIN sakila.rental r ON i.inventory_id = r.inventory_id
    JOIN sakila.customer cu ON r.customer_id = cu.customer_id
    JOIN sakila.staff s ON r.staff_id = s.staff_id
    JOIN sakila.store st ON s.store_id = st.store_id
    JOIN sakila.address a ON st.address_id = a.address_id
    JOIN sakila.city ci ON a.city_id = ci.city_id
    JOIN sakila.country co ON ci.country_id = co.country_id
    JOIN sakila.payment p ON r.rental_id = p.rental_id;
