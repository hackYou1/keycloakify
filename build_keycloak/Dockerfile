FROM jboss/keycloak:11.0.3

USER root

WORKDIR /

ADD configuration /opt/jboss/keycloak/standalone/configuration/

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]