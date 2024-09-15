# SonarQube

```bash
# Sample scan command
docker run --rm -e SONAR_HOST_URL="http://sonar.enblitz.com"  -v "./:/usr/src" sonarsource/sonar-scanner-cli
```