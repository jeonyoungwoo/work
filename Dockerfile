FROM ubuntu:18.04


LABEL MAINTAINER "ywjeon"

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nginx

FROM nginx

RUN ["pwd"]
WORKDIR /usr/share/nginx/html
ADD index.html /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=2s --timeout=5s --retries=5 CMD curl --fail http://localhost:80 || exit 1

CMD ["nginx", "-g", "daemon off;"]


