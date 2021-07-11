FROM centos:latest

RUN yum -y install java wget
RUN java -version

RUN mkdir -p /apps/tomcat/
WORKDIR /apps/tomcat/
RUN wget https://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz
RUN tar -xvf apache-tomcat-8.5.69.tar.gz
RUN mv apache-tomcat-8.5.69 tomcat8

WORKDIR /apps/tomcat/tomcat8/webapps/
COPY target/vivek-app.war /apps/tomcat/tomcat8/webapps/

EXPOSE 8080

CMD ["/apps/tomcat/tomcat8/bin/catalina.sh", "run"]
