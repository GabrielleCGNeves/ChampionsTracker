FROM node:alpine AS builder

WORKDIR /app

COPY package*.json ./
COPY prisma ./prisma/

RUN npm ci

COPY . .

RUN npm run db:generate
RUN npm run build
RUN npm ci --omit dev


FROM node:alpine
USER node:node
WORKDIR /app
COPY --from=builder --chown=node:node /app/build ./build
COPY --from=builder --chown=node:node /app/node_modules ./node_modules
COPY --from=builder --chown=node:node /app/prisma ./prisma
COPY --chown=node:node package.json .

EXPOSE 3000
# CMD ["node", "-r", "dotenv/config", "build"]
CMD [ "npm", "run", "start:migrate:prod" ]