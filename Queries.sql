--- SQL queries for the Bookstore database and the results of the queries.

-- 1. How many books are available in each category?
SELECT c.category_name, COUNT(b.book_id) AS total_books
FROM Categories c
         LEFT JOIN Books b ON c.category_id = b.category_id
GROUP BY c.category_name;
-- Non-Fiction 1
-- Fiction 4


-- 2. Which author has the highest average book rating according to customer reviews?
SELECT a.name AS author_name, AVG(r.rating) AS avg_rating
FROM Authors a
         JOIN Books b ON a.author_id = b.author_id
         JOIN Reviews r ON b.book_id = r.book_id
GROUP BY a.name
ORDER BY AVG(r.rating) DESC
    LIMIT 1;
--Yukichi Fukuzawa 5

-- 3. What is the total revenue generated from all orders for each author's books?
SELECT a.name AS author_name, SUM(b.price * o.quantity) AS total_revenue
FROM Authors a
         JOIN Books b ON a.author_id = b.author_id
         JOIN Orders o ON b.book_id = o.book_id
GROUP BY a.name;
-- Yukichi Fukuzawa 89.97
-- Shikibu Murasaki 139.96
-- Soseki Natsume 99.96
-- Osamu Dazai 111.96
-- Ryunosuke Akutagawa 59.97


-- 4. List the top 5 best-selling books (in terms of quantity sold), including their titles and total quantities sold.
SELECT b.title, SUM(o.quantity) AS total_quantity_sold
FROM Books b
         JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.title
ORDER BY total_quantity_sold DESC
    LIMIT 5;
-- The Tale of Genji 4
-- I Am a Cat 4
-- No Longer Human 4
-- Rashomon 3
-- An Encouragement of Learning 3



-- 5. Which customer has placed the most orders, and how many orders have they placed?
SELECT c.name AS customer_name, COUNT(o.order_id) AS total_orders_placed
FROM Customers c
         JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_orders_placed DESC
    LIMIT 1;

-- Levi Ackerman 2

-- 6. Find the average price of books in each category, and list them from highest to lowest average price.
SELECT c.category_name, ROUND(AVG(b.price), 2) AS avg_price
FROM Categories c
         JOIN Books b ON c.category_id = b.category_id
GROUP BY c.category_name
ORDER BY avg_price DESC;
-- Non-Fiction 29.99
-- Fiction 26.99

-- 7. How many customers joined in each year? Use the join_date from the Customers table for your calculation.
SELECT EXTRACT(YEAR FROM join_date) AS join_year, COUNT(customer_id) AS total_customers
FROM Customers
GROUP BY join_year
ORDER BY join_year;
--2022 5

-- 8. What is the total number of books sold in each category?
SELECT c.category_name, SUM(o.quantity) AS total_books_sold
FROM Categories c
         JOIN Books b ON c.category_id = b.category_id
         JOIN Orders o ON b.book_id = o.book_id
GROUP BY c.category_name;
-- Non-Fiction 3
-- Fiction 15


-- 9. Which book has received the highest number of reviews, and what is the average rating of that book?
SELECT b.title, COUNT(r.review_id) AS total_reviews, ROUND(AVG(r.rating), 2) AS avg_rating
FROM Books b
         JOIN Reviews r ON b.book_id = r.book_id
GROUP BY b.title
ORDER BY total_reviews DESC
    LIMIT 1;
-- The Tale of Genji 1 5

-- 10. For each category, find the book with the highest price. List the category name, book title, and price.
SELECT c.category_name, b.title, b.price
FROM Categories c
         JOIN Books b ON c.category_id = b.category_id
WHERE (b.price, b.category_id) IN (
    SELECT MAX(price), category_id
    FROM Books
    GROUP BY category_id
);
-- Non-Fiction,An Encouragement of Learning,29.99
-- Fiction,Rashomon,19.99
-- Fiction,I Am a Cat,24.99
-- Fiction,The Tale of Genji,34.99
-- Fiction,No Longer Human,27.99


-- 11. List all authors who have not had any of their books ordered.
SELECT a.name AS author_name
FROM Authors a
         LEFT JOIN Books b ON a.author_id = b.author_id
WHERE b.book_id IS NULL;
--0

-- 12. What is the average rating of books for each category, and how does it compare to the overall average rating across all categories?
SELECT
    c.category_name,
    ROUND(AVG(r.rating), 2) AS avg_rating_category,
    (SELECT ROUND(AVG(rating), 2) FROM Reviews) AS overall_avg_rating
FROM Categories c
         JOIN Books b ON c.category_id = b.category_id
         JOIN Reviews r ON b.book_id = r.book_id
GROUP BY
    c.category_name;

-- Non-Fiction,5,4.2
-- Fiction,4,4.2


-- 13. Identify customers who have placed orders totaling more than $100. List their names and the total amount spent.
SELECT c.name AS customer_name, SUM(b.price * o.quantity) AS total_amount_spent
FROM Customers c
         JOIN Orders o ON c.customer_id = o.customer_id
         JOIN Books b ON o.book_id = b.book_id
GROUP BY c.name
HAVING SUM(b.price * o.quantity) > 100;

-- Eren Yeager,115.96
-- Erwin Smith,160.95
-- Armin Arlert,114.95


-- 14. Which month of the year has seen the highest number of books sold?
SELECT EXTRACT(MONTH FROM order_date ) AS sold_month, SUM(quantity) AS total_books_sold
FROM Orders
GROUP BY EXTRACT(MONTH FROM order_date )
ORDER BY total_books_sold DESC
    LIMIT 1;
-- 3 7

-- 15. Find all books that have never been reviewed. List their titles and publication years.
SELECT b.title, b.publication_year
FROM Books b
         LEFT JOIN Reviews r ON b.book_id = r.book_id
WHERE r.review_id IS NULL;
--0 (all reviewed)