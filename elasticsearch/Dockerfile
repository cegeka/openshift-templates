FROM elasticsearch:5.6.13

MAINTAINER OpenShift Development <dev@lists.openshift.redhat.com>

EXPOSE 9200
EXPOSE 9300
USER 0

ENV ES_CONF=/etc/elasticsearch/ \
    ES_HOME=/usr/share/elasticsearch \
    ES_VER=5.6.13 \
    HOME=/opt/app-root/src \
    INSTANCE_RAM=512G \
    JAVA_VER=1.8.0 \
    NODE_QUORUM=1 \
    OSE_ES_VER=5.6.13.3-redhat-1 \
    PROMETHEUS_EXPORTER_VER=5.6.13.1-redhat-1 \
    PLUGIN_LOGLEVEL=INFO \
    RECOVER_AFTER_NODES=1 \
    RECOVER_EXPECTED_NODES=1 \
    RECOVER_AFTER_TIME=5m \
    RELEASE_STREAM=prod \
    DHE_TMP_KEY_SIZE=2048 \
    container=oci

ARG OSE_ES_VER=5.6.13.3-redhat-1
ARG OSE_ES_URL
ARG PROMETHEUS_EXPORTER_VER=5.6.13.1-redhat-1
ARG PROMETHEUS_EXPORTER_URL
ARG MAVEN_REPO_URL=http://download-node-02.eng.bos.redhat.com/brewroot/repos/lpc-rhel-7-maven-build/latest/maven/

ADD probe/ ${ES_HOME}/probe/
ADD init.sh run.sh install.sh ${HOME}/

RUN ${HOME}/install.sh

WORKDIR ${HOME}
USER 1000
CMD ["bash", "/opt/app-root/src/run.sh"]
