## The 4 tables
users        user_id, name, email, phone, password, role (customer/admin), created_at
foods        food_id, name, description, price, image, category, branch ('Branch A'/'Branch B'),
             is_available
orders       order_id, user_id, order_type (delivery/pickup), address, phone, total_amount,
             status, rider_name, created_at
order_items  item_id, order_id, food_id, branch, quantity, price, subtotal

## Features (final list)

Customer: register and login, view menu by branch, search and filter by category, one cart with items from both branches, checkout (delivery or pickup, Cash on Delivery), My Orders with status tracking.

Admin: dashboard with simple stats (orders, revenue per branch), manage foods for both branches (add, edit, delete, price, availability), view and filter orders by branch, update order status, assign rider.

Order status: Pending, Confirmed, Preparing, Out for Delivery (or Ready for Pickup), Delivered (or Completed).

Pages (9 total): Home, Menu, Cart, Checkout, Login/Register, My Orders, Admin Dashboard, Admin Foods, Admin Orders.


# Where to start

Build in this order: Navbar, Menu page, Cart, Checkout, Login, My Orders, then Admin. The menu is the heart of the site, so it comes first, and fake data keeps you unblocked.

7-day plan
Day 1: Setup
You: repo, develop branch, branch protection, Issues, labels. Vite React app, Navbar, Router with empty pages. (feature/client-setup, feature/navbar, feature/routing)
Member 2: Express server, /api/health, MySQL connection, .env.example. (feature/server-setup)
Member 3: schema.sql for the 4 tables, pushed by end of day. (feature/db-schema)

Done when: the navbar links work and the server says OK.

Day 2: Menu and login
You: Home page (hero and two branch cards). FoodCard and Menu page with a branch switch and category filter, using fake data. Login/Register pages. (feature/home-page, feature/menu-page, feature/auth-ui)
Member 2: GET /api/foods?branch=&category=&search=, register/login API (bcrypt + JWT), adminOnly middleware. (feature/foods-api, feature/auth-api)
Member 3: seed.sql: 1 admin, 2 customers, about 10 foods per branch. Start the ER diagram. (feature/db-seed, docs/er-diagram)

Done when: you can log in and the menu loads real foods for each branch.

Day 3: Cart and checkout
You: CartContext (each item carries its branch), Cart page grouped by branch, Checkout page with the delivery/pickup toggle. (feature/cart, feature/checkout)
Member 2: POST /api/orders: read prices from the database, insert orders and order_items in one transaction. (feature/orders-api)
Member 3: Use Case diagram, test the order queries, start the test cases. (docs/diagrams)

Done when: an order with food from both branches creates the right rows in MySQL. Merge to main and tag v0.5.

Day 4: My Orders and admin backend
You: connect Checkout to the API, build My Orders with a status tracker. (feature/my-orders)
Member 2: GET /api/orders/my, admin APIs: foods CRUD, all orders (filter by branch), update status, assign rider, stats. (feature/admin-api)
Member 3: DFD Level 0 and 1, test Days 1-3, log bugs as GitHub Issues. (docs/dfd)
Day 5: Admin UI
You: admin route protection, Admin Dashboard (stat cards), Manage Foods (table, add/edit form, availability toggle), Manage Orders (branch filter, status dropdown, rider field). (feature/admin-ui)
Member 2: fix bugs from Issues, add input validation. (fix/validation)
Member 3: SRS draft, test the admin flow. (docs/srs)

Done when: the admin updates a status and the customer sees it change. Tag v0.9.

Day 6: Polish and testing
You: responsive CSS, loading, error and empty-cart states. (feature/polish)
Member 2: security check (admin routes protected, no secrets committed), final bug fixes. (fix/final-bugs)
Member 3: full end-to-end test, record pass/fail in the test cases. (docs/test-results)
Day 7: Submission
You: final merge develop to main, tag v1.0, create a GitHub Release.
Member 2: test setup on a fresh clone and fix any README gaps.
Member 3: README with screenshots, final SQL export, slides, demo video. (docs/readme)
Order flow
text
Cart (Branch A + Branch B items)
   ↓ Checkout (delivery or pickup)
orders (1 row) + order_items (each row tagged with its branch)
   ↓
Admin: filters by branch, updates status, assigns rider
   ↓
Customer sees status in My Orders
GitHub rules (what your teacher checks)
One Issue, one branch, one Pull Request per task, with Closes #n in the PR.
No direct pushes to main or develop. You review every PR and leave a comment.
Tag releases at v0.5, v0.9 and v1.0.
Use branch, checkout -b, merge, stash, revert, tag, log --graph, diff and blame at least once, and plan one merge conflict on purpose to resolve.
