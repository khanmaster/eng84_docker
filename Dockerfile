# We need to use nignx official image as our base image
# We will a key workd called FROM

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
