CREATE DATABASE subscription_db;
USE subscription_db;
SELECT DATABASE();

CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(30) DEFAULT 'CUSTOMER'
);

CREATE TABLE products (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    type VARCHAR(100),
    sales_price DECIMAL(10,2),
    cost_price DECIMAL(10,2),
    notes TEXT
);

CREATE TABLE plans (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    billing_cycle VARCHAR(30),
    price DECIMAL(10,2),
    minimum_quantity INT DEFAULT 1
);

CREATE TABLE subscriptions (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    plan_id BIGINT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (plan_id) REFERENCES plans(id)
);

CREATE TABLE invoices (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    subscription_id BIGINT,
    invoice_date DATE,
    due_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(30),
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(id)
);

CREATE TABLE payments (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    invoice_id BIGINT,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_date DATE,
    note TEXT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id)
);
SHOW TABLES;

