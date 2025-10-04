# Use official Node.js runtime as base image
FROM node:18-alpine

# Set working directory in container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy rest of application code
COPY . .

# Expose port 5000
EXPOSE 5000

# Command to run the application
CMD ["npm", "start"]