FROM ibmcom/websphere-traditional:9.0.5.0-ubi

#Hardcode password for admin console
COPY ./tWAS/PASSWORD /tmp/PASSWORD

#COPY ./resources/db2/ /opt/IBM/db2drivers/

#COPY ./resources/jmx_exporter/jmx_prometheus_javaagent-0.11.0.jar /opt/IBM/jmx_exporter/
#COPY ./resources/jmx_exporter/jmx-config.yaml /opt/IBM/jmx_exporter/

COPY ./config/install_app.py /work/config/

COPY ./config/was-config.props  /work/config/app-update.props
COPY ./HelloWorld/target/HelloWorld.war /work/config/HellowWorld.war

RUN /work/configure.sh
