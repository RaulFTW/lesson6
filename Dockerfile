FROM ubuntu:20.04
RUN apt-get update && apt-get install default-jdk tomcat9 maven -y
RUN mkdir -p /usr/local/boxfuse
COPY /boxfuse/* /usr/local/boxfuse
RUN cd /usr/local/boxfuse && mvn package
RUN cp /usr/local/boxfuse/*.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]
