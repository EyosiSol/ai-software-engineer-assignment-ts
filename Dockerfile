#our docker image uses the node 20 alpine as base version
FROM node:20-alpine

#Showing our docker that this is our working directory
WORKDIR /app

#copy the package json and (package-lock if available)
COPY package*.json ./

#Install the code dependencies 
RUN npm install 

#copy all the app into our container
COPY . .

#RUN The test 
CMD ["npm", "test"]



