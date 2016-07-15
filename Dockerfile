## BUILDING
##   (from project root directory)
##   $ docker build -t drejmar-stacksmith .
##
## RUNNING
##   $ docker run drejmar-stacksmith

FROM gcr.io/stacksmith-images/debian:wheezy-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="5i07ngb" \
    STACKSMITH_STACK_NAME="drejmar/stacksmith" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install java-1.8.0_91-0 --checksum 64cf20b77dc7cce3a28e9fe1daa149785c9c8c13ad1249071bc778fa40ae8773

ENV PATH=/opt/bitnami/java/bin:$PATH \
    JAVA_HOME=/opt/bitnami/java

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Java base template
COPY . /app
WORKDIR /app
