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
credentials-binding \
credentials \
docker-plugin \
docker-slaves \
git \
groovy \
pipeline-utility-steps

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
ENV JAVA_OPTS="-Djenkins.install.state=INITIAL_SECURITY_SETUP"

USER root

RUN mkdir /var/jenkins_home/jobs/petclinic-pipeline/
COPY config.xml /var/jenkins_home/jobs/petclinic-pipeline/
RUN chown -R root:jenkins /var/jenkins_home/jobs/petclinic-pipeline/

USER root
