#!/bin/bash

echo "🚀 Mobility Voting App - Initial Setup"
echo "======================================"

# Create directory structure
echo "📁 Creating project structure..."
mkdir -p backend/pb_migrations
mkdir -p frontend/src/{lib,routes/admin}
mkdir -p scripts
mkdir -p docker

# Create package.json for frontend
echo "📦 Setting up frontend..."
cat > frontend/package.json << 'EOF'
{
  "name": "mobility-voting-frontend",
  "version": "1.0.0",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "vite dev",
    "build": "vite build",
    "preview": "vite preview"
  },
  "devDependencies": {
    "@sveltejs/adapter-node": "^5.0.0",
    "@sveltejs/kit": "^2.0.0",
    "@sveltejs/vite-plugin-svelte": "^4.0.0",
    "svelte": "^5.0.0",
    "vite": "^5.0.0"
  },
  "dependencies": {
    "pocketbase": "^0.21.0"
  }
}
EOF

# Create docker-compose.yml
echo "🐳 Setting up Docker configuration..."
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  pocketbase:
    image: ghcr.io/muchobien/pocketbase:latest
    container_name: voting_pocketbase
    restart: unless-stopped
    ports:
      - "8090:8090"
    volumes:
      - ./backend/pb_data:/pb_data
      - ./backend/pb_migrations:/pb_migrations
    healthcheck:
      test: wget --no-verbose --tries=1 --spider http://localhost:8090/api/health || exit 1
      interval: 5s
      timeout: 5s
      retries: 5

  frontend:
    build: ./frontend
    container_name: voting_frontend
    restart: unless-stopped
    ports:
      - "3000:3000"
    environment:
      - PUBLIC_POCKETBASE_URL=http://pocketbase:8090
      - NODE_ENV=production
    depends_on:
      - pocketbase
EOF

# Create .env.example
echo "🔐 Creating environment template..."
cat > .env.example << 'EOF'
# PocketBase
POCKETBASE_URL=http://localhost:8090
PB_ADMIN_EMAIL=admin@example.com
PB_ADMIN_PASSWORD=secure-password-here

# Frontend
PUBLIC_POCKETBASE_URL=http://localhost:8090
NODE_ENV=development

# WordPress Migration (optional)
WP_DB_HOST=localhost
WP_DB_PORT=3306
WP_DB_USER=
WP_DB_PASSWORD=
WP_DB_NAME=

# Deployment
SERVER_IP=
DOMAIN=vote.yourdomain.com
EOF

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. cd frontend && npm install"
echo "2. Copy .env.example to .env and configure"
echo "3. docker-compose up -d"
echo "4. Access PocketBase at http://localhost:8090/_/"
echo ""
echo "For detailed instructions, see README.md"