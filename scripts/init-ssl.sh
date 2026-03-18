#!/bin/bash
set -e

DOMAIN="devas.pt"
EMAIL="joaodevesa2019@gmail.com"
APP_DIR="/home/cards/www/cards-without-humanity"

cd "$APP_DIR"

echo ">>> A subir com config HTTP temporária..."
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

echo ">>> A ativar config SSL..."
cp nginx/nginx-ssl.conf nginx/nginx.conf
docker compose restart nginx

echo ">>> SSL configurado com sucesso!"