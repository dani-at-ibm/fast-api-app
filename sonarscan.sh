#!/bin/bash
docker run --rm --net=host -v /usr/bin:/fast-api-app sonarsource/sonar-scanner-cli sonar-scanner -D sonar.projectBaseDir=/app