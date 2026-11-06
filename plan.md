FoodieGo -- Complete Project Plan
1. Project Overview
Project Name: FoodieGo -- Online Food Delivery System

FoodieGo is a web-based food ordering and delivery management system.
Customers can browse food menus from two restaurant branches, add food
items from both branches to one cart, and place an order for delivery or
self-pickup.

Each branch manages its own menu, prices, food availability, and order
preparation. A shared delivery system coordinates delivery orders from
both branches.
Project Objectives
- Make food browsing and ordering easy for customers.
- Manage two restaurant branches through one website.
- Maintain branch-specific food prices and availability.
- Allow customers to order food from multiple branches in one cart.
- Split combined orders into separate branch orders for processing.
- Manage delivery and self-pickup workflows.
- Provide an administrator dashboard for system management.
2. Project Scope and Main Decisions
  Area                                Decision
  Restaurant branches                 Two predefined branches

  Service area                        One fixed service area

  Branch menus                        Each branch manages its own menu
and availability

  Cart policy                         One cart can contain food from both
branches

  Order processing                    The combined order is split into
separate branch orders

  Delivery                            One shared delivery management
system

  Pickup                              Customer collects food from the
relevant branch or branches

  Payment                             Cash on Delivery for delivery; cash
at counter for pickup
Main user roles                     Customer, Restaurant Manager,
Administrator
Scope Limitations
- Only two predefined branches will be supported.
- Both branches will operate within one fixed service area.
- Online payment gateway integration is not included in the initial
  version.
- Live GPS tracking and advanced route optimization are not included.
- A multi-branch cart may require the customer to receive food
  collected from more than one branch.
3. User Roles and Responsibilities
3.1 Customer
- Register, log in, and manage their profile.
- Browse food categories and both branch menus.
- View branch-specific food prices and availability.
- Add food items from multiple branches to one cart.
- Update quantities or remove cart items.
- Choose Delivery or Self Pickup at checkout.
- Provide or select a delivery address.
- Place orders using the supported cash payment method.
- View order status and order history.
- Submit reviews for eligible orders.
3.2 Restaurant Manager
- Log in to the restaurant management panel.
- Manage the assigned branch.
- Add, edit, and remove food items from the branch menu.
- Update branch-specific prices, stock, and availability.
- View incoming orders for the assigned branch.
- Accept or reject branch orders.
- Update food preparation status.
- Mark pickup orders as ready.
3.3 Administrator
- Manage users and restaurant managers.
- Manage the two restaurant branches.
- Manage food categories and common food item records.
- Monitor combined orders and branch orders.
- Manage shared delivery personnel.
- Assign delivery personnel to deliveries.
- Monitor delivery and payment statuses.
- View basic system reports.
4. Main Features and Modules
1. User Registration and Login
2. Role-Based Access Control
3. Branch Management
4. Food Category Management
5. Branch-Wise Menu Management
6. Food Availability and Stock Management
7. Multiple-Branch Cart Management
8. Checkout and Order Splitting
9. Branch Order Management
10. Shared Delivery Management
11. Self-Pickup Management
12. Cash Payment Management
13. Order Tracking and Status History
14. Customer Address Management
15. Customer Reviews
16. Administrator Dashboard
5. Website Pages / Interface Plan
Public and Customer Pages
- Splash Screen
- Home Page
- Food Categories
- Branch Menu / Food Listing
- Food Details
- Cart
- Checkout
- Login
- Registration
- Customer Profile
- Customer Addresses
- My Orders / Order Tracking
- Order History
- Reviews
Restaurant Manager Pages
- Manager Dashboard
- Branch Menu Management
- Add / Edit Food Item
- Branch Inventory and Availability
- Incoming Branch Orders
- Order Details and Preparation Status
Administrator Pages
- Admin Dashboard
- User Management
- Branch Management
- Category Management
- Food Item Management
- All Orders
- Delivery Personnel Management
- Delivery Assignment
- Reports
6. Branch Menu Design
Each branch has its own menu records and manages availability
independently.

The food_items table stores common food information, such as the food
name, description, category, and image. The branch_food_items table
stores branch-specific information, such as branch, price, stock
quantity, and availability.
Example
  Food Item        Branch       Price Availability
  Chicken Burger   Branch A      ৳180 Available
Chicken Burger   Branch B      ৳200 Available
Pizza            Branch A      ৳450 Available
Pizza            Branch B       --- Unavailable
Pasta            Branch A       --- Unavailable
Pasta            Branch B      ৳250 Available

This structure allows the same food item to have different prices and
availability in different branches.
7. Cart and Checkout Design
Multiple-Branch Cart
A customer can add food items from Branch A and Branch B to the same
cart.

Example:

  Food Item           Branch          Price
  Chicken Burger      Branch A         ৳180
Pizza               Branch A         ৳450
Pasta               Branch B         ৳250
Cart Subtotal                ৳880

At checkout, the system validates the current price and availability of
every item. It then creates one combined customer order and separate
branch orders.
Order Structure
- orders: the customer's combined order.
- branch_orders: the separate order for each branch.
- order_items: the food items belonging to each branch order.
Each branch receives and processes only its own branch order. The
customer sees one combined order summary.
8. Order Processing Workflow
1. Customer browses the menus of both branches.
2. Customer adds food items to the cart.
3. The system checks food availability and current prices.
4. Customer chooses Delivery or Self Pickup.
5. Customer confirms the order.
6. The system creates one combined order.
7. The system splits the cart items into separate branch orders.
8. Each branch receives and processes its own order.
9. The system updates order statuses.
10. The customer can view the combined order and its branch-level
    progress.
9. Delivery Workflow
FoodieGo uses one shared delivery management system for both branches.
1. Customer selects Delivery and provides a delivery address.
2. The relevant branches receive their branch orders.
3. Each branch prepares its food.
4. When the required branch orders are ready, the delivery becomes
   eligible for pickup.
5. The administrator or authorized system operator assigns a delivery
   person.
6. The delivery person collects the relevant items from the required
   branch or branches.
7. The delivery person delivers the combined order to the customer.
8. The delivery status is updated to Delivered.
9. The customer pays using Cash on Delivery.
Important design consideration: If an order contains food from both
branches, the delivery person may need to collect from both branches.
The system should track each branch pickup separately.
10. Self-Pickup Workflow
1. Customer selects Self Pickup.
2. The system identifies the branch or branches associated with the
   cart items.
3. Each branch receives its own branch order.
4. Each branch prepares its items.
5. The customer collects the food from the relevant branch or branches.
6. The customer pays at the restaurant counter.
11. Payment Plan
Initial payment methods:
- Delivery: Cash on Delivery.
- Self Pickup: Cash payment at the restaurant counter.
The system records payment status. For a combined order containing
multiple branch orders, payment records and settlement rules must be
designed consistently. The initial implementation should clearly record
whether payment is pending, paid, or failed/cancelled where applicable.
12. Order Status Design
Branch Order Status
- Pending
- Accepted
- Preparing
- Ready
- Rejected
Delivery Status
- Waiting for Branches
- Ready for Pickup
- Assigned
- Picked Up
- Out for Delivery
- Delivered
- Cancelled
Pickup Status
- Pending
- Preparing
- Ready for Pickup
- Collected
The combined order status should be derived from its branch orders and,
when applicable, its delivery status.
13. Database Design
The proposed database contains 17 tables.
                       No. Table Name               Purpose

                         1 `users`                  Customer, restaurant
                                                    manager, and
                                                    administrator
                                                    accounts

                         2 `branches`               Information about the
                                                    two restaurant
                                                    branches

                         3 `categories`             Food categories

                         4 `food_items`             Common food item
                                                    information

                         5 `branch_food_items`      Branch-specific
                                                    price, stock, and
                                                    availability

                         6 `carts`                  Customer cart
                                                    information

                         7 `cart_items`             Items in a cart,
                                                    including their
                                                    branch-specific menu
                                                    record

                         8 `orders`                 Customer's combined
                                                    order

                         9 `branch_orders`          Separate order for
                                                    each branch

                        10 `order_items`            Items belonging to a
                                                    branch order

                        11 `payments`               Payment information
                                                    and status

                        12 `delivery_persons`       Shared delivery
                                                    personnel

                        13 `deliveries`             Delivery assignment
                                                    and delivery status

                        14 `delivery_pickups`       Branch pickup records
                                                    for a delivery

                        15 `customer_addresses`     Customer delivery
                                                    addresses

                        16 `order_status_history`   History of order
                                                    status changes

                        17 `reviews`                Customer reviews and
                                                    ratings

13.1 Proposed Attributes
1. users
- user_id -- INT, PK
- full_name -- VARCHAR(100)
- email -- VARCHAR(100), UNIQUE
- phone -- VARCHAR(20)
- password -- VARCHAR(255)
- role -- ENUM
- branch_id -- INT, FK, nullable for non-manager users
- profile_image -- VARCHAR(255), nullable
- status -- ENUM
- created_at -- DATETIME
2. branches
- branch_id -- INT, PK
- branch_name -- VARCHAR(100)
- address -- TEXT
- phone -- VARCHAR(20)
- email -- VARCHAR(100)
- opening_time -- TIME
- closing_time -- TIME
- status -- ENUM
3. categories
- category_id -- INT, PK
- category_name -- VARCHAR(100)
- description -- TEXT
- image -- VARCHAR(255)
- status -- ENUM
4. food_items
- food_id -- INT, PK
- category_id -- INT, FK
- food_name -- VARCHAR(100)
- description -- TEXT
- image -- VARCHAR(255)
- preparation_time -- INT
- status -- ENUM
5. branch_food_items
- branch_food_id -- INT, PK
- branch_id -- INT, FK
- food_id -- INT, FK
- price -- DECIMAL(10,2)
- stock_quantity -- INT
- availability -- BOOLEAN
- created_at -- DATETIME
- updated_at -- DATETIME
6. carts
- cart_id -- INT, PK
- user_id -- INT, FK
- status -- ENUM
- created_at -- DATETIME
- updated_at -- DATETIME
7. cart_items
- cart_item_id -- INT, PK
- cart_id -- INT, FK
- branch_food_id -- INT, FK
- quantity -- INT
- unit_price -- DECIMAL(10,2)
- added_at -- DATETIME
8. orders
- order_id -- INT, PK
- user_id -- INT, FK
- address_id -- INT, FK, nullable for pickup
- order_type -- ENUM
- total_amount -- DECIMAL(10,2)
- delivery_charge -- DECIMAL(10,2)
- discount -- DECIMAL(10,2)
- grand_total -- DECIMAL(10,2)
- payment_status -- ENUM
- order_status -- ENUM
- created_at -- DATETIME
9. branch_orders
- branch_order_id -- INT, PK
- order_id -- INT, FK
- branch_id -- INT, FK
- subtotal -- DECIMAL(10,2)
- order_status -- ENUM
- preparation_time -- INT
- accepted_at -- DATETIME, nullable
- completed_at -- DATETIME, nullable
10. order_items
- order_item_id -- INT, PK
- branch_order_id -- INT, FK
- branch_food_id -- INT, FK
- food_name -- VARCHAR(100)
- quantity -- INT
- unit_price -- DECIMAL(10,2)
- subtotal -- DECIMAL(10,2)
11. payments
- payment_id -- INT, PK
- order_id -- INT, FK
- branch_order_id -- INT, FK, nullable
- payment_method -- ENUM
- amount -- DECIMAL(10,2)
- payment_status -- ENUM
- paid_at -- DATETIME, nullable
12. delivery_persons
- delivery_person_id -- INT, PK
- full_name -- VARCHAR(100)
- phone -- VARCHAR(20)
- email -- VARCHAR(100)
- password -- VARCHAR(255)
- vehicle_type -- VARCHAR(50)
- availability_status -- ENUM
- created_at -- DATETIME
13. deliveries
- delivery_id -- INT, PK
- order_id -- INT, FK
- delivery_person_id -- INT, FK, nullable until assigned
- delivery_address -- TEXT
- delivery_charge -- DECIMAL(10,2)
- delivery_status -- ENUM
- assigned_at -- DATETIME, nullable
- picked_up_at -- DATETIME, nullable
- delivered_at -- DATETIME, nullable
14. delivery_pickups
- pickup_id -- INT, PK
- delivery_id -- INT, FK
- branch_order_id -- INT, FK
- branch_id -- INT, FK
- pickup_status -- ENUM
- picked_up_at -- DATETIME, nullable
15. customer_addresses
- address_id -- INT, PK
- user_id -- INT, FK
- full_address -- TEXT
- area -- VARCHAR(100)
- city -- VARCHAR(100)
- postal_code -- VARCHAR(20)
- address_type -- ENUM
- is_default -- BOOLEAN
16. order_status_history
- history_id -- INT, PK
- order_id -- INT, FK
- branch_order_id -- INT, FK, nullable
- old_status -- VARCHAR(50), nullable
- new_status -- VARCHAR(50)
- changed_by -- INT, FK
- changed_at -- DATETIME
17. reviews
- review_id -- INT, PK
- user_id -- INT, FK
- order_id -- INT, FK
- food_id -- INT, FK
- rating -- INT
- comment -- TEXT
- created_at -- DATETIME
Database Design Notes
- Use foreign keys to maintain relationships between tables.
- Store passwords as secure password hashes, never as plain text.
- Use DECIMAL(10,2) for monetary values.
- Use created_at and updated_at timestamps where useful.
- Add suitable indexes to frequently searched foreign keys and status
  fields.
- Add a unique constraint on (branch_id, food_id) in
  branch_food_items to prevent duplicate menu records for the same
  food in one branch.
- Store the ordered food name and unit price in order_items as
  historical snapshots so later menu changes do not alter old orders.
- Before implementation, finalize the payment model. A simple design
  is one payment record per combined order; if branch-level payment
  settlement is required, use branch-level payment records
  consistently instead of mixing both approaches.
- Avoid storing the same delivery address in multiple places
  unnecessarily. The order can reference customer_addresses, while a
  delivery record may store a snapshot only if the address must remain
  unchanged after checkout.
- A review should be tied to an actual purchased item/order. Consider
  using order_item_id in reviews instead of only food_id to
  validate that the customer ordered the food.
14. Main Database Relationships
- One user can create multiple carts over time and multiple orders.
- One branch can have multiple restaurant managers and multiple branch
  food records.
- One category can contain multiple food items.
- One food item can be offered by multiple branches.
- One cart can contain multiple cart items.
- One cart item references one branch-specific food item.
- One combined order can contain multiple branch orders.
- One branch order belongs to one branch.
- One branch order can contain multiple order items.
- One delivery belongs to one combined delivery order.
- One delivery can have multiple branch pickup records.
- One delivery person can handle multiple deliveries over time.
- One customer can save multiple addresses.
- One order can have multiple status history records.
15. Technology Stack and Tools
Proposed Technologies
  Layer                     Technology
  Frontend                  HTML5, CSS3, JavaScript, Bootstrap
Backend                   PHP
Database                  MySQL
Local Server              XAMPP
Database Administration   phpMyAdmin
Code Editor               Visual Studio Code
Version Control           Git
Repository Hosting        GitHub

This stack is the proposed implementation stack and can be adjusted if
the team and instructor agree on a different one.
16. GitHub and Team Collaboration
The project repository should contain:
- Frontend source code
- Backend source code
- Database SQL file
- README.md
- Project proposal and final report
- Screenshots and/or video demonstration
Team Members
1. Ahmed Musa Al Galib -- Student ID: \(Add Student ID\)
2. Umme Salma Zimia -- Student ID: \(Add Student ID\)
3. Rezwan Hossain Prince -- Student ID: \(Add Student ID\)
All team members should make meaningful commits and push their
contributions regularly. Work should be divided into clear tasks and
branches where appropriate.
17. Development Phases
  Phase                               Tasks
  1. Requirement Analysis            Confirm requirements, roles, scope,
and workflows

  2. System Design                   Use Case, Activity, ER, and
architecture diagrams

  3. Database Development            Create tables, keys, relationships,
and sample data

  4. Frontend Development            Build public, customer, manager,
and admin interfaces

  5. Authentication                  Implement registration, login, and
role-based access

  6. Menu and Cart                   Implement branch menus,
availability, and multi-branch cart

  7. Order Management                Implement checkout, order
splitting, and branch processing

  8. Delivery and Pickup             Implement shared delivery and
self-pickup workflows

  9. Testing                         Test features, relationships, and
edge cases
10. Documentation                  Complete README, report,
screenshots, and demo
18. Testing Checklist
- Customer can register and log in.
- Users can access only the pages permitted for their roles.
- Both branches can manage their own menus.
- The same food can have different branch-specific prices.
- Unavailable food cannot be ordered.
- Customer can add food from both branches to one cart.
- Cart totals are calculated correctly.
- Checkout creates one combined order and the correct branch orders.
- Each manager can see only their branch orders.
- Branch order statuses update correctly.
- Shared delivery can record pickups from both branches.
- Self-pickup orders can be marked ready and collected.
- Payment status is recorded correctly.
- Order history and status history display correctly.
19. Important Design Decisions to Finalize Before Coding
The following details still need confirmation before the final database
implementation:
1. Delivery fee: One delivery fee for the combined order, or a
   separate fee per branch?
2. Combined delivery timing: Should the delivery person wait until
   all branch orders are ready before collecting?
3. Self-pickup: Should a customer collect from each branch
   separately when the cart contains items from both?
4. Payment settlement: Should the customer pay once for the
   combined order, or pay each branch separately?
5. Order cancellation: Can the customer cancel the whole order, or
   only an individual branch order?
These decisions affect the final SQL constraints and order workflow. The
proposed design provides a foundation, but these points should be agreed
upon by the team before implementation.