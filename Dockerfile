FROM jboss/keycloak:4.1.0.Final
MAINTAINER 6congyao@gmail.com
 
ADD op-realm.json /opt/jboss/keycloak/

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]

EXPOSE 8080

CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/op-realm.json"]
