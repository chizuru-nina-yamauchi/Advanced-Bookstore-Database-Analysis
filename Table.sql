-- Create the tables

CREATE TABLE Authors (
                         author_id SERIAL PRIMARY KEY,
                         name VARCHAR(100) NOT NULL,
                         country VARCHAR(100) NOT NULL
);


CREATE TABLE Categories (
                            category_id SERIAL PRIMARY KEY,
                            category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
                       book_id SERIAL PRIMARY KEY,
                       title VARCHAR(100) NOT NULL,
                       author_id INT NOT NULL,
                       category_id INT NOT NULL,
                       price DECIMAL(10, 2) NOT NULL,
                       FOREIGN KEY (author_id) REFERENCES Authors(author_id),
                       FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Orders (
                        order_id SERIAL PRIMARY KEY,
                        book_id INT NOT NULL,
                        customer_id INT NOT NULL,
                        quantity INT NOT NULL,
                        order_date DATE NOT NULL,
                        FOREIGN KEY (book_id) REFERENCES Books(book_id),
                        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Customers (
                           customer_id SERIAL PRIMARY KEY,
                           name VARCHAR(100) NOT NULL,
                           email VARCHAR(100) NOT NULL,
                           join_date DATE NOT NULL
);

CREATE TABLE Reviews (
                         review_id SERIAL PRIMARY KEY,
                         book_id INT NOT NULL,
                         customer_id INT NOT NULL,
                         comment TEXT NOT NULL,
                         rating INT NOT NULL,
                         review_date DATE NOT NULL,
                         FOREIGN KEY (book_id) REFERENCES Books(book_id),
                         FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);