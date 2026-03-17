#!/bin/bash
set -e

DOMAIN="devas.pt"
EMAIL="joaodevesa2019@gmail.com"
APP_DIR="/home/cards/www/cards-without-humanity"

cd "$APP_DIR"

echo ">>> A subir Nginx em modo HTTP (para o desafio ACME)..."
docker compose up -d nginx

echo ">>> A obter certificado inicial..."
docker compose run --rm certbot certonly \
  --webroot \
  --webroot-path=/var/www/certbot \
  --email "$EMAIL" \
  --agree-tos \
  --no-eff-email \
  -d "$DOMAIN" \
  -d "www.$DOMAIN"

echo ">>> A reiniciar Nginx com SSL ativo..."
docker compose restart nginx

echo ">>> SSL configurado com sucesso!"