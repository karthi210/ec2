# Use Node LTS
FROM node:20-alpine

# Create working directory
WORKDIR /app

# Install dependencies required for Medusa
RUN apk add --no-cache git python3 make g++

# Copy package files
COPY package.json yarn.lock ./

# Install Yarn
RUN npm install -g yarn

# Install dependencies
RUN yarn install

# Copy project files
COPY . .

# Build project
RUN yarn build

# Expose Medusa port
EXPOSE 9000

# Start Medusa server
CMD ["yarn","start"]
