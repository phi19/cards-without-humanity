# Fase 1: build
FROM node:22-alpine AS build
WORKDIR /app

# Copia e instala o shared primeiro
COPY shared ./shared
WORKDIR /app/shared
RUN npm ci && npm run build

# Volta ao backend
WORKDIR /app
COPY backend/package*.json ./
COPY backend/prisma ./prisma
RUN npm ci
COPY backend/ .
RUN npm run build

# Fase 2: runtime
FROM node:22-alpine
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/prisma ./prisma
COPY --from=build /app/shared ./shared
COPY backend/package*.json ./
RUN npm ci --omit=dev

EXPOSE 3000
CMD ["sh", "-c", "npx prisma migrate deploy && node dist/index.js"]