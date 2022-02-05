FROM ubuntu:20.04
RUN apt-get update && apt-get install git default-jdk tomcat9 -y
RUN git clone git@github.com:boxfuse/boxfuse-sample-java-war-hello.git /opt/
RUN mvn package /opt/boxfuse-sample-java-war-hello/
RUN cp /opt/boxfuse-sample-java-war-hello/*.war /var/lib/tomcat9/webapps
