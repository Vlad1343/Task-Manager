# # Specify Linux distribution
# FROM node:alpine 

# # Copy project files
# COPY . /docker
# WORKDIR /app
# CMD ["node", "docker.js"]


FROM node:alpine
WORKDIR /app
COPY docker.js .
CMD ["node", "docker.js"]