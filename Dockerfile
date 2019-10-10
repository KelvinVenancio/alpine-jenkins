FROM jenkins/jenkins:lts-alpine

USER root

RUN apk -U add docker
# Setup Jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN apk add --update shadow \
    && groupadd -g 50 staff \
    && usermod -a -G staff jenkins

COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

USER jenkins
RUN /usr/local/bin/install-plugins.sh \
blueocean \
build-environment \
cloudbees-folder \
config-file-provider \
credentials-binding \
credentials \
docker-plugin \
docker-slaves \
envinject \
git \
greenballs \
groovy \
http_request \
job-dsl \
jobConfigHistory \
naginator \
pam-auth \
pipeline-utility-steps \
nexus-artifact-uploader \
workflow-aggregator \
sonar

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
USER root
