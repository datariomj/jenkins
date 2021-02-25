FROM jenkins/jenkins:2.263.4-lts-alpine

ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY init-admin.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY init-executor.groovy /usr/share/jenkins/ref/init.groovy.d/

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
# RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

VOLUME /var/jenkins_home
VOLUME /certs/client