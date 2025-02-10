# Step 1: Build the application
FROM node:22 AS build

# Set the working directory to /app
WORKDIR /app

# Copy the application code
COPY papermark .

# Install dependencies
RUN npm install

# Step 2: Create the running image
FROM node:22-slim

# Set the working directory to /app
WORKDIR /app

# Copy the built application from the build stage
COPY --from=build /app .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
