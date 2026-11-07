# FoodieGo - Online Food Delivery System

FoodieGo is a web-based food delivery application. Customers can browse food items, add them to a cart, and complete an order using either delivery or self-pickup.

The project currently contains the React frontend for the application. Backend and database integration can be added as separate services as development continues.

## Team Members

| No. | Name | Student ID |
|:---:|---|---|
| 1 | Ahmed Musa Al Galib | 241400046 |
| 2 | Umme Salma Zimia | 241400055 |
| 3 | Tamanna Ahmed Tasin | 241400033 |

## Technology Stack

### Current frontend

- React
- React DOM
- React Router
- JavaScript (ES modules)
- Vite
- CSS

### Planned application services

- Backend API: to be selected and added
- Database: MySQL is currently the planned database

### Development tools

- Visual Studio Code
- Git and GitHub
- npm

## Project Structure

```text
FoodieGo/
├── public/                 # Static public assets
├── src/
│   ├── assets/             # Images and other imported assets
│   ├── components/         # Reusable React components
│   ├── pages/              # Page-level React components
│   ├── App.jsx             # Application routes and layout
│   └── main.jsx            # Frontend entry point
├── index.html
├── package.json
└── vite.config.js
```

## Prerequisites

Install the following software:

- [Node.js](https://nodejs.org/) (which includes npm)
- [Git](https://git-scm.com/)
- [Visual Studio Code](https://code.visualstudio.com/) (recommended)

XAMPP is not required to run the current frontend.

## Installation and Running

Clone the repository and enter the frontend directory:

```bash
git clone https://github.com/theZimia/software-engineering-project.git
cd software-engineering-project/FoodieGo
```

Install dependencies:

```bash
npm install
```

Start the Vite development server:

```bash
npm run dev
```

Open the URL printed in the terminal, usually:

```text
http://localhost:5173/
```

## Available Scripts

Run these commands from the `FoodieGo` directory:

| Command | Description |
|---|---|
| `npm run dev` | Start the development server |
| `npm run build` | Create a production build |
| `npm run preview` | Preview the production build locally |
| `npm run lint` | Check the frontend source with Oxlint |

## Where to Put the Database

Yes, keep database-related files in a separate top-level folder. The database server itself does not live inside the React app; only its schema, migrations, seed data, and documentation should be stored in the repository.

A recommended structure is:

```text
software-engineering-project/
├── FoodieGo/               # React/Vite frontend
├── backend/                # Backend API and server-side code
│   ├── src/
│   ├── .env.example        # Database connection variable names only
│   └── package.json        # Or the relevant backend manifest
├── database/               # Database scripts, not the database server
│   ├── migrations/         # Versioned schema changes
│   ├── seed/               # Development/sample data
│   └── schema.sql          # Optional complete initial schema
└── Docs/
```

The React frontend should call the backend API. It should **not** contain database credentials or connect directly to MySQL, because browser code is public and direct access would expose the database.

When the backend and database are added:

1. Put API/server code in `backend/`.
2. Put SQL schema, migrations, and seed scripts in `database/`.
3. Store local connection settings in an uncommitted `backend/.env` file.
4. Commit only a safe `backend/.env.example` containing placeholder values.
5. Configure the frontend with a public API base URL, such as `VITE_API_URL`, when needed.

The existing database design notes are available in [Docs/database.md](Docs/database.md).

## Implemented and Planned Features

| Feature | Status |
|---|---|
| Home page | Frontend in progress |
| Restaurant and food browsing | Frontend in progress |
| Food menu | Frontend in progress |
| Shopping cart | Frontend in progress |
| Checkout page | Frontend in progress |
| User registration and login | UI present; backend integration pending |
| Order placement | Backend integration pending |
| Delivery and self-pickup processing | Backend integration pending |
| Order management | Backend integration pending |
| Restaurant management | Planned |
| Admin management | Planned |

## Documentation

- [Frontend notes](Docs/frontend.md)
- [Backend notes](Docs/backend.md)
- [Database design](Docs/database.md)

## Screenshots and Demonstration

Screenshots and a video demonstration will be added as the application is completed.

---

**Project:** FoodieGo
**Course:** Software Engineering Laboratory (SWE Lab)
**Project type:** Academic mini project
