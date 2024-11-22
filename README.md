# CediPower 🇬🇭

CediPower is a Rails application that helps users track and compare prices of goods across various markets and stores in Ghana. The platform provides real-time price information, historical trends, and market comparisons to help consumers make informed purchasing decisions.

## Features 🌟

- **Price Tracking**: Monitor prices of various items across different markets
- **Market Directory**: Browse through various markets and stores in Ghana
- **Category Navigation**: Browse items by categories
- **Price History**: View historical price trends with charts
- **User Roles**: 
  - Admin: Manage all aspects of the platform
  - Store Owner: Manage market prices and information
  - General User: Track prices and save favorite items
- **PWA Support**: Progressive Web App capabilities for mobile users
- **SEO Optimized**: Built-in SEO features with meta tags and sitemap generation

## Technology Stack 💻

- **Backend**: Ruby 3.3.6, Rails 8.0.0
- **Database**: PostgreSQL
- **Frontend**: Tailwind CSS, Hotwire (Turbo & Stimulus)
- **Authentication**: Devise
- **Authorization**: Pundit
- **Charts**: Chartkick & Groupdate
- **SEO**: FriendlyId, meta-tags, sitemap_generator
- **Testing**: Minitest, Capybara
- **Deployment**: Docker, Kamal

## Prerequisites 📋

Before you begin, ensure you have installed:
- Ruby 3.3.6
- PostgreSQL
- Node.js & Yarn
- Docker (for production deployment)

## Development Setup 🛠️

1. Clone the repository:

```bash
git clone https://github.com/yourusername/cedi_power.git
cd cedi_power
```

2. Install dependencies:

```bash
bundle install
```

3. Setup database:

```bash
bin/rails db:prepare
```

4. Start the development server:

```bash
bin/dev
```

Visit `http://localhost:3000` to see the application.

## Testing 🧪

Run the test suite:

```bash
bin/rails test                  # Run all tests
bin/rails test:system          # Run system tests
bin/rails test:controllers     # Run controller tests
```

## Code Quality 🔍

Run the linters:

```bash
bin/rubocop                    # Ruby code style checker
bin/brakeman                   # Security vulnerability scanner
```

## Deployment 🚀

Deploy using Kamal:

```bash
bin/kamal setup                # First-time setup
bin/kamal deploy               # Regular deployments
```

## Environment Variables 🔐

Required environment variables:

```bash
RAILS_MASTER_KEY=<your-master-key>
DATABASE_URL=postgresql://localhost/cedi_power_development
RAILS_ENV=development
```

## Project Structure 📁

```
app/
├── controllers/              # Application controllers
│   ├── admin/               # Admin namespace
│   └── store_owner/         # Store owner namespace
├── models/                  # ActiveRecord models
├── policies/               # Pundit authorization policies
├── views/                  # View templates
└── javascript/            # JavaScript files
config/
├── routes.rb              # Application routes
└── database.yml          # Database configuration
```

## Troubleshooting 🔧

Common issues:
- **Database Connection**: Ensure PostgreSQL is running
- **Asset Compilation**: Run `bin/rails assets:precompile`
- **Test Database**: Run `bin/rails db:test:prepare`

## License 📄

This project is proprietary software

## Acknowledgments 🙏

- Built with [Ruby on Rails](https://rubyonrails.org/)
- Styled with [Tailwind CSS](https://tailwindcss.com/)
- Charts powered by [Chartkick](https://chartkick.com/)

---

Made with ❤️ in Ghana 🇬🇭