FROM openjdk:17-jdk-alpine3.14

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN apt-get install -y bash
RUN apk add --no-cache curl tar && \
    wget -q https://downloads.apache.org/tomcat/tomcat-10/v10.1.6/bin/apache-tomcat-10.1.6.tar.gz && \
    tar -xzf apache-tomcat-10.1.6.tar.gz && \
    rm apache-tomcat-10.1.6.tar.gz && \
    mv apache-tomcat-10.1.6 $CATALINA_HOME

COPY target/java-web-app*.war $CATALINA_HOME/webapps/java-web-app.war


EXPOSE 8080

CMD ["catalina.sh", "run"]
