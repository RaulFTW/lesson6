FROM ubuntu:20.04
RUN apt-get update && apt-get install default-jdk tomcat9 maven -y
RUN mkdir -p /usr/local/boxfuse

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

# let "Tomcat Native" live somewhere isolated
ENV TOMCAT_NATIVE_LIBDIR $CATALINA_HOME/native-jni-lib
ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$TOMCAT_NATIVE_LIBDIR

COPY /boxfuse/* /usr/local/boxfuse/
RUN cd /usr/local/boxfuse && mvn package
RUN cp /usr/local/boxfuse/target/*.war /var/lib/tomcat9/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
