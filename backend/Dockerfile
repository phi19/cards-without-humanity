# Fase 1: build
FROM node:22-alpine AS build
WORKDIR /app

COPY shared ./shared
WORKDIR /app/shared
RUN npm install && npm run build

WORKDIR /app/backend
COPY backend/package*.json ./
COPY backend/prisma ./prisma
RUN npm install
COPY backend/ .
RUN npm run build

# Fase 2: runtime
FROM node:22-alpine
WORKDIR /app
COPY --from=build /app/backend/dist ./dist
COPY --from=build /app/backend/prisma ./prisma
COPY --from=build /app/shared ./shared
COPY backend/package*.json ./
RUN npm install --omit=dev

EXPOSE 3000
CMD ["sh", "-c", "npx prisma migrate deploy && node dist/index.js"]