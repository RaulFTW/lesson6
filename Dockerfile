FROM ubuntu:20.04
RUN apt-get update && apt-get install default-jdk maven tomcat9 -y
ADD /home/raul/boxfuse/ /tmp/boxfuse
RUN mvn package /tmp/boxfuse
RUN cp /tmp/boxfuse/*.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]
