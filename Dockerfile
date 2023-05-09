FROM registry.access.redhat.com/jboss-eap-7/eap74-openjdk11-openshift-rhel8

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