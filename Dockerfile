FROM debian:bullseye
RUN apt-get update && apt-get -y full-upgrade && apt-get install -y hugo nginx && apt-get clean
COPY . /hmst
RUN hugo -v --source=/hmst/website --destination=/var/www/html
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
