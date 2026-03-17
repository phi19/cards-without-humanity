FROM node:22

WORKDIR /app

COPY package*.json ./
COPY prisma ./prisma

RUN npm install --production
COPY . .

EXPOSE 3000
CMD ["node", "server.js"]