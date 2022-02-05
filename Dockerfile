FROM ubuntu:20.04
RUN apt-get update && apt-get install default-jdk maven tomcat9 -y
COPY /home/raul/boxfuse /usr/local/boxfuse
RUN mvn package /usr/local/boxfuse
RUN cp /tmp/boxfuse/*.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]
