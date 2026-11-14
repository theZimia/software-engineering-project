# Foodiego – Food Delivery System

Foodiego is a food delivery web application. This README documents the initial MySQL database setup and the four core tables used by the application.

## 1. Database Setup

Create the database and select it:

```sql
CREATE DATABASE foodiego_db;
USE foodiego_db;
```

## 2. Database Tables

### 2.1 `users`

Stores customer, restaurant owner, and administrator account information.

```sql
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    password VARCHAR(255) NOT NULL,
    role ENUM(
        'customer',
        'restaurant_owner',
        'administrator'
    ) DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**User roles**

| Role | Responsibility |
|---|---|
| `customer` | Browse food and place orders |
| `restaurant_owner` | Manage food menu, prices, and restaurant orders |
| `administrator` | Manage the Foodiego application |

### 2.2 `foods`

Stores food details for the available branches.

```sql
CREATE TABLE foods (
    food_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image VARCHAR(255),
    category VARCHAR(50),
    branch ENUM('Branch A', 'Branch B'),
    is_available BOOLEAN DEFAULT TRUE
);
```

### 2.3 `orders`

Stores customer order and delivery or pickup information.

```sql
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_type ENUM('delivery', 'pickup') NOT NULL,
    address TEXT,
    phone VARCHAR(20),
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    rider_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
);
```

### 2.4 `order_items`

Stores the individual food items included in each order.

```sql
CREATE TABLE order_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    food_id INT NOT NULL,
    branch ENUM('Branch A', 'Branch B'),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (food_id)
        REFERENCES foods(food_id)
);
```

## 3. Verify the Database

Show all tables:

```sql
SHOW TABLES;
```

Check each table's structure:

```sql
DESCRIBE users;
DESCRIBE foods;
DESCRIBE orders;
DESCRIBE order_items;
```

## 4. Database Relationships

- One user can place many orders.
- One order can contain many order items.
- Each order item refers to one food item.
- Each order belongs to one user.

## 5. Important Notes

- Execute the SQL in order: database, `users`, `foods`, `orders`, then `order_items`.
- The `user_id`, `order_id`, and `food_id` columns connect the tables through foreign keys.
- Store passwords as secure password hashes in the application; never store plain-text passwords.
- The current `foods` table does not yet link each food to its restaurant owner. To support owner-specific menu management, consider adding an `owner_id` column that references `users(user_id)` and validating that the referenced user has the `restaurant_owner` role.

---
