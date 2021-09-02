#!/bin/bash

cd /Users/a19245029/projects/my-app/build_keycloak

docker rm keycloak-testing-container || true

docker build . -t my-app/keycloak-hot-reload

docker run \
	-p 8080:8080 \
	--name keycloak-testing-container \
	-e KEYCLOAK_USER=admin \
	-e KEYCLOAK_PASSWORD=admin \
	-v /Users/a19245029/projects/my-app/build_keycloak/src/main/resources/theme/my-app:/opt/jboss/keycloak/themes/my-app:rw \
	-it my-app/keycloak-hot-reload:latest
