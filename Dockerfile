FROM jenkins/jenkins:lts

ARG BUILD_JENKINS_PLUGINS="\
      git:3.5.1 \
      github-oauth:0.27 \
      matrix-auth:1.7 \
      workflow-aggregator:2.5 \
      docker-workflow:1.13 \
      credentials-binding:1.13 \
      kubernetes:1.0 \
      build-token-root:1.4 \
      envinject:2.1.3 \
      text-file-operations:1.3.2 \
      pipeline-githubnotify-step:1.0.3 \
      blueocean:1.2.2 \
      blueocean-github-pipeline:1.2.2 \
      blueocean-display-url:2.1.0 \
      slack:2.3 \
      greenballs:1.15 \
      "

ADD rootfs /

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false -Dhudson.DNSMultiCast.disabled=true -Djava.awt.headless=true"

RUN /usr/local/bin/install-plugins.sh $BUILD_JENKINS_PLUGINS

# Specify the initial user name for Jenkins admin user
# ENV JENKINS_USER xxxxxxx

# Specify the initial password for Jenkins admin user
# ENV JENKINS_PASS xxxxxxx

COPY init.groovy /usr/share/jenkins/ref/init.groovy.d/

EXPOSE 8080
