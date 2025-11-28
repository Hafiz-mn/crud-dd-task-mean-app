# Base image for node.js
FROM node:18-alpine         

# Set working directory inside container
WORKDIR /app                

# Copies only packages file first
COPY package*.json ./      

# Install Dependencies
RUN npm install             

# Copies remaining backend code
COPY . .                    

# Exposes Backend port
EXPOSE 8080                 

# Starts the backend
CMD ["node", "server.js"]   



