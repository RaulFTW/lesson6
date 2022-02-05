FROM ubuntu:20.04
RUN apt-get update && apt-get install default-jdk tomcat9 maven -y
RUN mkdir -p /usr/local/boxfuse

RUN rm -fr /opt/tomcat/webapps/*

COPY /boxfuse/* /usr/local/boxfuse/
RUN cd /usr/local/boxfuse && mvn package
RUN cp /usr/local/boxfuse/target/*.war /var/lib/tomcat9/webapps/

EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh" "run"]
