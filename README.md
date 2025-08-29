# Mobility Voting Platform

A modern, lightweight voting platform built with PocketBase and SvelteKit, designed to replace WordPress-based voting systems.

## 🚀 Features

- **Modern Tech Stack**: PocketBase + SvelteKit for optimal performance
- **Real-time Voting**: Live updates and results
- **Admin Dashboard**: Comprehensive poll management
- **Vote Security**: IP and fingerprint validation
- **Mobile-First**: Fully responsive design
- **Easy Migration**: WordPress data import tools included
- **Lightweight**: Minimal resource requirements

## 🛠️ Tech Stack

- **Backend**: PocketBase (SQLite, REST/Realtime APIs)
- **Frontend**: SvelteKit 
- **Database**: SQLite (via PocketBase)
- **Hosting**: Hetzner Cloud / Any VPS
- **Proxy**: CloudFlare Tunnel

## 📦 Quick Start

### Prerequisites
- Docker & Docker Compose
- Node.js 20+
- Git

### Local Development

```bash
# Clone the repository
git clone https://github.com/yourusername/mobility-voting-app.git
cd mobility-voting-app

# Copy environment variables
cp .env.example .env

# Start services
docker-compose up -d

# Access the app
# Frontend: http://localhost:3000
# PocketBase Admin: http://localhost:8090/_/
```

## 🔄 WordPress Migration

```bash
# Configure WordPress credentials in .env
# Run migration script
node scripts/migrate-from-wordpress.js
```

## 🚢 Deployment

### Hetzner VPS (Recommended)

```bash
# Run deployment script
./scripts/deploy-to-hetzner.sh YOUR_SERVER_IP
```

### CloudFlare Tunnel Setup

1. Install CloudFlare tunnel on VPS
2. Configure in Zero Trust dashboard
3. Point to `http://localhost:3000`

## 📁 Project Structure

```
mobility-voting-app/
├── backend/               # PocketBase configuration
├── frontend/             # SvelteKit application
├── scripts/              # Deployment & migration scripts
├── docker/               # Docker configurations
├── docker-compose.yml    # Local development setup
└── README.md
```

## 🚀 Deployment Options

- Hetzner Cloud VPS
- DigitalOcean Droplets
- Any Docker-capable host
- Self-hosted servers

## 📄 License

MIT

## 🤝 Contributing

Contributions welcome! Please feel free to submit a Pull Request.