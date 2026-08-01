FROM node:18-alpine

# Set working directory
WORKDIR /opt/app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy project files
COPY . .

# Build Strapi admin panel
ENV NODE_ENV=production
RUN npm run build

# Expose port
EXPOSE 1337

# Start Strapi
CMD ["npm", "run", "start"]