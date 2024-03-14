
-- Insert sample into Authors table
INSERT INTO Authors (name, country) VALUES
                                        ('Yukichi Fukuzawa', 'Japan'),
                                        ('Ryunosuke Akutagawa', 'Japan'),
                                        ('Soseki Natsume', 'Japan'),
                                        ('Shikibu Murasaki', 'Japan'),
                                        ('Osamu Dazai', 'Japan');

-- Insert data into Categories table
INSERT INTO Categories (category_name) VALUES
                                           ('Non-Fiction'),
                                           ('Fiction'),
                                           ('Fiction'),
                                           ('Fiction'),
                                           ('Fiction');

-- Insert data into Books table
INSERT INTO Books (title, author_id, category_id, price, publication_year) VALUES
                                                                               ('An Encouragement of Learning', 1, 1, 29.99, 1872),
                                                                               ('Rashomon', 2, 2, 19.99, 1915),
                                                                               ('I Am a Cat', 3, 3, 24.99, 1905),
                                                                               ('The Tale of Genji', 4, 4, 34.99, 1008),
                                                                               ('No Longer Human', 5, 5, 27.99, 1948);

-- Insert data into Customers table
INSERT INTO Customers (name, email, join_date) VALUES
                                                   ('Eren Yeager', 'eren@aot.com', '2022-01-01'),
                                                   ('Mikasa Ackerman', 'mikasa@aot.com', '2022-01-15'),
                                                   ('Armin Arlert', 'armin@aot.com', '2022-02-05'),
                                                   ('Levi Ackerman', 'levi@aot.com', '2022-02-20'),
                                                   ('Erwin Smith', 'erwin@aot.com', '2022-03-10');

-- Insert data into Reviews table
INSERT INTO Reviews (book_id, customer_id, rating, comment, review_date) VALUES
                                                                             (1, 1, 5, 'Excellent book!', '2023-02-01'),
                                                                             (2, 2, 4, 'Very interesting!', '2023-02-10'),
                                                                             (3, 3, 4, 'Enjoyed reading it', '2023-03-01'),
                                                                             (4, 4, 5, 'Masterpiece!', '2023-03-15'),
                                                                             (5, 5, 3, 'It was okay', '2023-04-01');


-- Insert data into Orders table
INSERT INTO Orders (book_id, customer_id, quantity, order_date) VALUES
                                                                    (1, 1, 2, '2023-01-15'),
                                                                    (2, 2, 1, '2023-01-20'),
                                                                    (3, 3, 3, '2023-02-05'),
                                                                    (4, 4, 1, '2023-02-10'),
                                                                    (5, 5, 2, '2023-02-20'),
                                                                    (1, 2, 1, '2023-03-01'),
                                                                    (2, 3, 2, '2023-03-10'),
                                                                    (3, 4, 1, '2023-03-15'),
                                                                    (4, 5, 3, '2023-03-25'),
                                                                    (5, 1, 2, '2023-04-05');