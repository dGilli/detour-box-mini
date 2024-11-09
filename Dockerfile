FROM httpd:alpine

ARG REDIRECTS=""
ENV REDIRECTS=$REDIRECTS
ENV SCRIPT="create-apache-config"

COPY $SCRIPT /usr/local/bin/$SCRIPT
RUN chmod +x /usr/local/bin/$SCRIPT
RUN /usr/local/bin/$SCRIPT /usr/local/apache2/conf/httpd.conf

EXPOSE 80
