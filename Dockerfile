FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
ARG CONTRAST_FILE=contrast/contrast.jar
COPY ${JAR_FILE} app.jar
COPY ${CONTRAST_FILE} /contrast/contrast.jar
ENV JAVA_TOOL_OPTIONS -javaagent:/contrast/contrast.jar
ENV CONTRAST__SERVER__ENVIRONMENT PRODUCTION
ENV CONTRAST__PROTECT__ENABLE=false
ENTRYPOINT ["java","-jar","/app.jar"]