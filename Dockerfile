FROM centos

ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH


COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN yum install -y java-1.8.0 wget && \
    chmod +x /usr/local/bin/entrypoint.sh && \
    wget http://apache.mirror.vexxhost.com/tomcat/tomcat-9/v9.0.2/bin/apache-tomcat-9.0.2.tar.gz && \
    tar -zxpvf apache-tomcat-9.0.2.tar.gz -C /opt/ && \
    mv /opt/apache-tomcat-9.0.2 /opt/tomcat


WORKDIR /opt/tomcat/bin/
EXPOSE 8080

CMD ["catalina.sh", "run"]