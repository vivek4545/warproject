FROM centos:latest

RUN yum -y install java
RUN java -version

RUN mkdir -p /apps/tomcat/
WORKDIR /apps/tomcat/
RUN wget https://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz
RUN tar -xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.69 tomcat

WORKDIR /apps/tomcat/webapps/
ADD /apps/jenkin_slave4/workspace/war_pipeline/target/vivek-app.war /apps/tomcat/webapps/

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
