FROM jenkins/jenkins:2.263.4-lts

ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt