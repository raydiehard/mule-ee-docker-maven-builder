FROM wslph/mule:4.2.2-ee

ENV MAVEN_VERSION 3.6.3

# SSL Cert for downloading mule tar.gz
#RUN apk --no-cache update && \
#    apk --no-cache upgrade && \
#    apk --no-cache add ca-certificates && \
#    update-ca-certificates && \
#    apk --no-cache add openssl wget && \
#    apk add --update tzdata && \
#    rm -rf /var/cache/apk/*
    
RUN mkdir -p /opt/maven \
  && cd /opt/maven \
  && wget "https://www.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" \
  && tar xzvf "apache-maven-$MAVEN_VERSION-bin.tar.gz" \
  && rm "apache-maven-$MAVEN_VERSION-bin.tar.gz"

ENV MAVEN_HOME "/opt/maven/apache-maven-$MAVEN_VERSION"

ENV PATH=$MAVEN_HOME/bin:$PATH
