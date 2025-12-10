# 🛒 Mini E-Commerce Platform

A simple **E-Commerce Web Application** built using **JSP, Servlets, Java, and MySQL**.
This project demonstrates the fundamentals of web application development in Java, including user authentication, session management, and database integration.

---

## ✨ Features

* 🔐 **User Authentication**

    * Signup / Login / Logout
* 🛍️ **Shopping Cart**

    * Add items to cart
    * View cart
    * Remove items
* 📦 **Order Management**

    * Place orders
    * View ordered items
    * Delete/cancel orders
* 🗄️ **com.ronak.model.Database Integration**

    * MySQL used for persisting user data, cart items, and orders

---

## 🛠️ Tech Stack

* **Frontend:** JSP, HTML, CSS
* **Backend:** Java Servlets
* **Database:** MySQL
* **Build Tool:** Maven
* **Server:** Apache Tomcat

---



## ⚙️ Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/ronak1743/Mini_Ecommers_platform.git
cd Mini_Ecommers_platform
```

### 2. Configure MySQL

```sql
CREATE DATABASE LetsOrder;

USE LetsOrder;

CREATE TABLE users (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(255),
  price DECIMAL(10,2) NOT NULL,
  image_url VARCHAR(255) NOT NULL
);

CREATE TABLE orders(
    oid INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    itemid INT,
    quantity INT,
);
 
CREATE TABLE cart(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    itemid INT,
    quantity INT,
);


```

Update your DB credentials in `com.ronak.model.Connecter.java` (this file is ignored in Git for security reasons).

Or

Initialise .env file with your Database credential.

### 3. Build & Run

* Open in **IntelliJ IDEA** (or Eclipse/VS Code with Maven support).
* Install dependencies via Maven.
* Deploy on **Apache Tomcat** server.
* Open `http://localhost:8080/Mini_Ecommers_platform`.

---



## 🤝 Contributing

Feel free to fork this repo, raise issues, and submit pull requests.

---

## 📜 License

This project is for learning purposes. You can use and modify it freely.
