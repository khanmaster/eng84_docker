# What is Containerisation Docker

- Why Docker
- Difference between containerisation and VM
- Docker installation and setup
- Docker hub account and repo - 
- Docker containers and images
- Building customised images, microservice

- `docker --version`
- `docker run hello-world`
- ` docker pull name of the image` 
- ` docker run name of the image`
- delete image `docker rmi name of the image` , `docker rmi name of the image -f` to force delete it
- checking running containers ` docker ps or docker ps -a` for all


### Automate the build steps of our nginx customised image
how? by using Dockerfile with set of instructions 
- Naming convention to create Dockerfile is `Dockerfile`

```
FROM nginx
# here we using nignx official image as our base image

LABEL MAINTAINER = shahrukh@spartaglobal.com 
# using label is a good practice but optional

COPY app1 /usr/share/nignx/html
# copying our app1 folder from our OS to default index.html location

EXPOSE 80
# EXPOSE is the keyword to use to expose the required port for the base image

CMD ["nginx", "-g", "daemon off;"]
# CMD will execute the command in this case as this information/instructions taken from the offcial image
```

- download an image of docker official image make it locally available

`docker run -d -p 4000:4000 docs/docker.github.io`

### Multi-Stage Production Ready build 
```
FROM node:6 as APP

# working directory inside the container

WORKDIR /usr/src/app

# copy dependencies

COPY package*.json ./

# Install npm

RUN npm install

# copy everything from current location to default location inside the container

COPY . .

FROM node:alpine

COPY --from=app /usr/src/app /usr/src/app
# This is the magic line that compresses the size

WORKDIR /usr/src/app
# define the port

EXPOSE 3000

# start the app with CMD

CMD ["node","app.js"]
```