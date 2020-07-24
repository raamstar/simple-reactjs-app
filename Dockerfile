# pull official base image
FROM node:14

# set working directory
WORKDIR '/app'



# install app dependencies
COPY package.json .

RUN npm install -g create-react-app
RUN npm install 
RUN npm install react-scripts@3.4.1 -g --silent
RUN npm install --save react react-dom react-scripts

# add app
COPY . ./

# start app
CMD ["npm", "start"]
