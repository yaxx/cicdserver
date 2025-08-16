FROM node:18-alpine AS build
WORKDIR /app

# Install dependencies
COPY server/package*.json tsconfig.json ./
RUN npm ci

# Copy source and build
COPY server/ .
RUN npm run build  # Compiles to dist/

# Runtime image
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/package*.json ./
RUN npm ci --only=production

ENV NODE_ENV=production
CMD ["node", "dist/server.js"]

