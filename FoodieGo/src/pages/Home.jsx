import "./Home.css";
import { Link } from "react-router-dom";
import logo from "../assets/images/FoodieGo_logo.png";

const categories = [
  { icon: "🍔", name: "Burgers", count: "12 places" },
  { icon: "🍕", name: "Pizza", count: "8 places" },
  { icon: "🍜", name: "Asian food", count: "15 places" },
  { icon: "🥗", name: "Healthy", count: "10 places" },
];

const benefits = [
  {
    icon: "⌖",
    title: "Local favorites",
    description: "Discover highly rated restaurants around your neighborhood.",
  },
  {
    icon: "⚡",
    title: "Fast delivery",
    description: "Follow your order from the kitchen to your front door.",
  },
  {
    icon: "♧",
    title: "Made for you",
    description: "Find meals that match your taste, schedule, and budget.",
  },
];

export default function Home() {

  return (
    <main className="home-page">
      <header className="home-header">
        <Link className="home-brand" to="/" aria-label="FoodieGo home">
          <img src={logo} alt="FoodieGo" />
        </Link>
		
        <nav className="home-nav" aria-label="Main navigation">
          <Link to="/menu">Menu</Link>
          <Link to="/my-orders">My orders</Link>
          <Link to="/login" className="home-nav-cta">
            Sign in
          </Link>
        </nav>
      </header>
      <section className="home-hero">

        <div className="home-hero-content">
          <p className="home-eyebrow">Good food. Good mood.</p>
          <h1>
            Your next
            <span> favorite meal</span>
            <br />
            is just Link click away.
          </h1>
          <p className="home-hero-copy">
            Order delicious meals from the best local restaurants and enjoy
            fresh food delivered right to your door.
          </p>
          <div className="home-actions">
            <Link className="home-button home-button-primary" to="/menu">
              Explore the menu <span aria-hidden="true">→</span>
            </Link>
            <Link className="home-button home-button-secondary" to="/register">
              Create an account
            </Link>
          </div>
          <div className="home-trust">
            <div className="home-avatar-stack" aria-hidden="true">
              <span>👩🏻</span>
              <span>👨🏽</span>
              <span>👩🏿</span>
            </div>
            <p>
              <strong>2,000+</strong> happy food lovers
            </p>
          </div>
        </div>

        <div className="home-hero-art" aria-label="A delicious bowl of food">
          <div className="home-art-glow" />
          <div
            className="home-food-bowl"
            role="img"
            aria-label="Bowl of noodles"
          >
            🍜
          </div>
          <div className="home-floating-card home-rating-card">
            <span className="home-card-icon">★</span>
            <span>
              <strong>4.9</strong>
              <small>Customer rating</small>
            </span>
          </div>
          <div className="home-floating-card home-delivery-card">
            <span className="home-card-icon">⌁</span>
            <span>
              <strong>25 min</strong>
              <small>Average delivery</small>
            </span>
          </div>
        </div>
      </section>

      <section className="home-section home-category-section">
        <div className="home-section-heading">
          <div>
            <p className="home-eyebrow">What are you craving?</p>
            <h2>Browse by category</h2>
          </div>
          <Link className="home-text-link" to="/menu">
            View all <span aria-hidden="true">→</span>
          </Link>
        </div>

        <div className="home-category-grid">
          {categories.map((category) => (
            <Link className="home-category-card" 
			to="/menu" 
			key={category.name}
			>
				
              <span className="home-category-icon" >
                {category.icon}
              </span>
              <strong>{category.name}</strong>
              <small>{category.count}</small>
            </Link>
          ))}
        </div>
      </section>

      <section className="home-section home-benefits-section">
        <div className="home-section-heading home-benefits-heading">
          <div>
            <p className="home-eyebrow">Why FoodieGo?</p>
            <h2>More than just delivery</h2>
          </div>
          <p>
            Everything you need for a better way to enjoy your favorite food.
          </p>
        </div>
        <div className="home-benefits-grid">
          {benefits.map((benefit) => (
            <article className="home-benefit" key={benefit.title}>
              <span className="home-benefit-icon" aria-hidden="true">
                {benefit.icon}
              </span>
              <h3>{benefit.title}</h3>
              <p>{benefit.description}</p>
            </article>
          ))}
        </div>
      </section>
    </main>
  );
}
