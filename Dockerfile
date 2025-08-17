FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

RUN npm run build

CMD ["node", "dist/index.js"]



# FROM node:18-alpine AS build
# WORKDIR /app

# COPY server/package*.json tsconfig.json ./
# RUN npm ci


# COPY server/ .
# RUN npm run build  # Compiles to dist/


# FROM node:18-alpine
# WORKDIR /app

# COPY --from=build /app/dist ./dist
# COPY --from=build /app/package*.json ./

# RUN npm ci --only=production

# ENV NODE_ENV=production
# CMD ["node", "dist/server.js"]

