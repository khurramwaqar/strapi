# Use a Node LTS base image
FROM node:16

# Set working directory
WORKDIR /app

# Copy package manifest & lock file
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy project files
COPY . .

# Build the Strapi project (this compiles admin panel)
RUN yarn build

# Expose Strapi's default port
EXPOSE 1337

# Start Strapi
CMD ["yarn", "start"]