
# Users table

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