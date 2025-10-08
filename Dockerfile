# ---- Stage 1: Build the Next.js app ----
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files first (for caching layers)
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy rest of the app
COPY . .

# Build the Next.js app
RUN npm run build

# ---- Stage 2: Production image ----
FROM node:19-alpine AS runner

WORKDIR /app

ENV NODE_ENV=production

# Copy only the necessary build output and files

COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/package*.json ./
 
# Install only production deps
RUN npm ci --omit=dev

# Expose the app port
EXPOSE 3000

# Start the Next.js server
CMD ["npm", "start"]
