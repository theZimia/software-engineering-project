# 🍔 FoodieGo - Online Food Delivery Website

## 📌 Project Overview

**FoodieGo** is a web-based online food delivery system developed as a Software Engineering course project. The platform allows customers to browse food items, add products to their cart, place orders, and track order status. Administrators can manage foods, categories, orders, users, and customer messages through an admin dashboard.

The project aims to provide a complete working food ordering system using PHP and MySQL rather than a simple design prototype.

---

# 👥 Team Information

- Project Name: FoodieGo
- Project Type: Online Food Delivery Website
- Course: Software Engineering
- Team Size: 3 Members

---

# 🛠 Technology Stack

## Frontend
- HTML5
- CSS3
- JavaScript

## Backend
- PHP

## Database
- MySQL

## Development Environment
- XAMPP

## Version Control
- Git
- GitHub

---

# 🎯 Project Objectives

The main goal of FoodieGo is to create a functional food delivery platform where:

- Customers can browse food items.
- Customers can search and filter foods.
- Customers can add products to cart.
- Customers can place orders online.
- Customers can track order status.
- Administrators can manage the entire system.

---

# 👤 User Roles

## Customer

Customers can:

- Register an account
- Login and Logout
- Browse food items
- Search foods
- Filter foods by category
- Add foods to cart
- Update cart quantities
- Place orders
- View order history
- Track order status
- Manage profile information

---

## Admin

Administrators can:

- Access Admin Dashboard
- Manage Foods
- Manage Categories
- Manage Orders
- Manage Users
- Manage Customer Messages
- Monitor Website Statistics

---

# 🌐 Frontend Features

## Public Pages

### Home Page
- Hero Banner
- Featured Foods
- Categories Section
- Special Offers

### Menu Page
- Food Listing
- Search Functionality
- Category Filtering

### Food Details Page
- Food Image
- Description
- Price
- Availability Status

### Cart Page
- Quantity Update
- Remove Item
- Subtotal Calculation
- Total Price Calculation

### Checkout Page
- Delivery Information
- Order Summary
- Cash on Delivery

### About Us Page
- Project Information
- Team Information

### Contact Us Page
- Contact Form
- Frequently Asked Questions (FAQ)

### Login & Registration
- Customer Authentication System

---

## Customer Pages

- My Orders
- Order Status Tracking
- My Profile

---

## Admin Pages

- Admin Dashboard
- Manage Foods
- Manage Categories
- Manage Orders
- Manage Users
- Manage Contact Messages

---

# 🧭 Navigation Bar

```text
FoodieGo Logo | Home | Menu | About Us | Contact | Cart | Login/Sign Up
```

After Login:

### Customer Navigation

```text
Home | Menu | My Orders | Profile | Cart | Logout
```

### Admin Navigation

```text
Dashboard | Foods | Categories | Orders | Users | Messages | Logout
```

---

# ⚙ Backend Features

## Authentication Module

- User Registration
- User Login
- User Logout
- Password Hashing
- Password Verification
- Session Management
- Role-Based Authorization

---

## Food Management

- Create Food
- Read Food
- Update Food
- Delete Food
- Food Search
- Food Filtering
- Food Availability Status
- Image Upload

---

## Cart Management

- Add to Cart
- Remove from Cart
- Update Quantity
- Calculate Subtotal
- Calculate Grand Total

---

## Checkout System

- Delivery Information Collection
- Order Summary
- Cash on Delivery
- Server-Side Price Verification

---

## Order Management

### Customer Features

- Place Order
- View Order History
- Track Order Status

### Admin Features

- Confirm Orders
- Update Order Status
- Manage Deliveries

---

## Order Status Flow

```text
Pending
   ↓
Confirmed
   ↓
Preparing
   ↓
Out for Delivery
   ↓
Delivered
```

---

## Contact Management

- Submit Contact Form
- Store Messages in Database
- Admin Message Review

---

# 🗄 Database Design

## users

Stores customer and admin account information.

### Fields

```text
user_id
name
email
phone
password
role
created_at
```

---

## categories

Stores food categories.

### Fields

```text
category_id
category_name
description
created_at
```

---

## foods

Stores food item information.

### Fields

```text
food_id
category_id
food_name
description
price
image
stock
availability
created_at
```

---

## orders

Stores customer orders.

### Fields

```text
order_id
user_id
customer_name
phone
address
total_amount
status
order_date
```

---

## order_items

Stores individual items for each order.

### Fields

```text
item_id
order_id
food_id
quantity
price
subtotal
```

---

## contact_messages

Stores customer messages.

### Fields

```text
message_id
name
email
subject
message
sent_at
```

---

## Optional Tables

### reviews

```text
review_id
user_id
food_id
rating
comment
created_at
```

### coupons

```text
coupon_id
code
discount_percentage
expiry_date
status
```

---

# 🏗 Project Structure

```text
FoodieGo/
│
├── assets/
│   ├── css/
│   ├── js/
│   └── images/
│
├── config/
│   └── database.php
│
├── auth/
│   ├── login.php
│   ├── register.php
│   └── logout.php
│
├── foods/
│
├── cart/
│
├── orders/
│
├── admin/
│
├── index.php
├── menu.php
├── about.php
├── contact.php
├── database.sql
├── README.md
└── .gitignore
```

---

# 👨‍💻 Team Contribution Plan

## Member 1 - Frontend Developer

Responsibilities:

- Homepage Development
- Menu Page Development
- Responsive Design
- CSS Styling
- JavaScript UI Interaction

---

## Member 2 - Backend Developer

Responsibilities:

- PHP Backend Development
- Authentication System
- Database Integration
- Food CRUD Operations
- Category CRUD Operations

---

## Member 3 - System Integration & Testing

Responsibilities:

- Cart System Development
- Checkout Module
- Order Management
- Testing
- Documentation
- Admin Panel Integration

---

# 🔀 GitHub Workflow

Branch Structure:

```text
main
│
├── frontend-branch
├── backend-branch
└── order-system-branch
```

Workflow:

1. Create Feature Branch
2. Implement Feature
3. Commit Changes
4. Push to GitHub
5. Create Pull Request
6. Review Code
7. Merge into Main Branch

---

# 🚀 Development Roadmap

## Phase 1 - Core Website

- Homepage
- Navigation Bar
- Menu Page
- Database Connection
- Login System
- Registration System

---

## Phase 2 - Ordering System

- Cart Functionality
- Quantity Management
- Checkout System
- Order Placement
- My Orders Page

---

## Phase 3 - Admin Panel

- Food Management
- Category Management
- Order Management
- Dashboard Statistics

---

## Phase 4 - Final Project

- Responsive Design
- Security Improvements
- Testing
- Documentation
- ER Diagram
- Screenshots
- Final Report

---

# 🔒 Security Requirements

The system will implement the following security measures:

- Use `password_hash()` for password encryption.
- Use `password_verify()` for authentication.
- Use Prepared Statements to prevent SQL Injection.
- Verify Admin Access on the server side.
- Never trust prices sent from the browser.
- Perform server-side price calculations.
- Use database transactions during order placement.
- Do not upload database credentials to GitHub.
- Validate all user inputs before database operations.

---

# 🎁 Future Enhancements

The following features may be added if time permits:

- Wishlist
- Food Reviews & Ratings
- Coupon System
- Order Cancellation
- Search Suggestions
- Customer Profile Picture
- Top Selling Foods
- Sales Reports
- Analytics Dashboard

---

# 📄 Project Deliverables

The final project submission should include:

- Source Code
- Database Script (SQL)
- README File
- SRS Documentation
- ER Diagram
- Use Case Diagram
- DFD (Level 0 & Level 1)
- Test Cases
- GitHub Repository
- Presentation Slides
- Project Report
- Working Demonstration

---

# ✅ Project Status

Current Status: Planning & Requirement Analysis Phase

The project requirements have been defined. Frontend, backend, and database implementation will be developed step by step according to the project roadmap.

---

## Developed By

**FoodieGo Team**

Software Engineering Project  
Online Food Delivery Management System