FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/demo-0.0.1-SNAPSHOT.jar
ARG CONTRAST_FILE=contrast/contrast.jar
ARG CONTRAST_CONFIG=contrast/contrast_security.yaml
COPY ${JAR_FILE} app.jar
COPY ${CONTRAST_FILE} /contrast/contrast.jar
COPY ${CONTRAST_CONFIG} /contrast/contrast_security.yaml
ENV JAVA_TOOL_OPTIONS -javaagent:/contrast/contrast.jar -Dcontrast.config.path=/contrast/contrast_security.yaml -Dcontrast.application.version=$(Build.BuildNumber)
ENV CONTRAST__APPLICATION__NAME=SpringBoot
ENV CONTRAST__SERVER__ENVIRONMENT=DEVELOPMENT
ENV CONTRAST__PROTECT__ENABLE=false
ENTRYPOINT ["java","-jar","/app.jar"]
