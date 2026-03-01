# This Dockerfile containerizes the SWE 645 HW1 survey web application
# using Nginx as the web server.

FROM nginx:latest

RUN rm -rf /usr/share/nginx/html/*

COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]