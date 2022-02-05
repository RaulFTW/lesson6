FROM ubuntu:20.04
RUN apt-get update && apt-get install default-jdk maven tomcat9 -y
RUN mvn package /home/raul/boxfuse/
ADD /home/raul/boxfuse/*.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]
