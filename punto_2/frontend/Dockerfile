#Image Base
FROM node:16.20

#Create docker workdir
WORKDIR /app/front
#Copy package to workdir
COPY package.json /app/front/
#Install dependencies
RUN npm install
#Copy all code to container folder
COPY . ./

#Command for start app
CMD [ "npm", "start" ]