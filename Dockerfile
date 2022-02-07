FROM ubuntu:20.04

MAINTAINER raul1991de@gmail.com

RUN apt-get update && apt-get install curl default-jdk maven git -y

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.58/* /opt/tomcat/.

RUN git clone git@github.com:boxfuse/boxfuse-sample-java-war-hello.git /usr/local/
RUN cd /usr/local/boxfuse-sample-java-war-hello && mvn package
RUN cp /usr/local/boxfuse-sample-java-war-hello/target/*.war /opt/tomcat/webapps

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
