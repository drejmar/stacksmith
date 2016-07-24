## BUILDING
##   (from project root directory)
##   $ docker build -t drejmar-stacksmith .
##
## RUNNING
##   $ docker run -p 8080:8080 drejmar-stacksmith
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:8080
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/debian:wheezy-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="yvz9qul" \
    STACKSMITH_STACK_NAME="drejmar/stacksmith" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install jetty-9.3.10.v20160621-1 --checksum 86bb0918c2a4a252e0e9b8aedd89fcb698d702971e3104d1b4ac53661d7331ed
RUN bitnami-pkg install java-1.8.0_101-0 --checksum 66b64f987634e1348141e0feac5581b14e63064ed7abbaf7ba5646e1908219f9

ENV PATH=/opt/bitnami/java/bin:$PATH \
    JAVA_HOME=/opt/bitnami/java \
    JETTY_BASE=/opt/bitnami/jetty

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Jetty server template
RUN ln -s $JETTY_BASE/webapps /app
WORKDIR /app
COPY . /app

EXPOSE 8080
CMD ["harpoon", "start", "--foreground", "jetty"]
