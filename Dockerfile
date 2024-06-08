# node:16 it will declare which version of node we want to use > you can choose any version of node as per your need
# node:Version-alpine > this alpine stands for pulling smaller size of node without affecting node functionality
# if you wan to use full size node image then dont put - alpine there 
FROM node:22-alpine

# declaring the working directory , this is common command memorize
WORKDIR /app

# this will tell to copy all my code base and copy it inside the workign directory we have created named goes by app
COPY . /app/

# write all commands that needs to be run before executing our project , same serial as we do in real project
RUN npm install
RUN npm run build
RUN npx prisma generate

# on which port number ypou have exposed your local sever map/expose that server number below
EXPOSE 3000

# -------- all above commands run when you are starting the image

# -------- below commands run when you want to start the container of which image you craeted above

CMD [ "node",'dist/index.js' ]


# after successfullt creating this file run [ docker build -t nameOfYourImage .]

