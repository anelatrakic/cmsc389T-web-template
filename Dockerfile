#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#there should be a total of 9 lines

# Use the node:10-alpine image as a base
FROM node:10-alpine

# Create a directory for the app and set node as the owner
# cmsc389T-web-template is path 
RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

# Set the working directory to path
WORKDIR /home/node/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

USER node

# install all packages from package.json
RUN npm install

# expose port 8080
EXPOSE 8080

COPY --chown=node:node . .

# run the app
CMD [ "node", "app.js" ]
