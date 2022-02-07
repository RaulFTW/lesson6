FROM ubuntu:20.04

MAINTAINER raul1991de@gmail.com

ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y tzdata git curl default-jdk maven

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.58/* /opt/tomcat/.

RUN git clone git@github.com:boxfuse/boxfuse-sample-java-war-hello.git /usr/local/boxfuse-sample-java-war-hello
RUN cd /usr/local/boxfuse-sample-java-war-hello && mvn package
RUN cp /usr/local/boxfuse-sample-java-war-hello/target/*.war /opt/tomcat/webapps

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
