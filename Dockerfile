FROM registry.redhat.io/jboss-eap-7/eap74-openjdk11-openshift-rhel8@sha256:21f9184414c0f05daed68788611c5a4ba5370471dc05bd4fd5b45d39ec7a4f0c

# file author / maintainer
MAINTAINER "Philip Hayes" "phayes@redhat.com"

# Copy war to deployments folder
COPY ROOT.war $JBOSS_HOME/standalone/deployments/

# User root to modify war owners
USER root

# Modify owners war
RUN chown jboss:jboss $JBOSS_HOME/standalone/deployments/ROOT.war

# Important, use jboss user to run image
USER jboss