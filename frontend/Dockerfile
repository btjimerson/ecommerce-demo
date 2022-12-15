FROM eclipse-temurin:17
WORKDIR /opt
EXPOSE 8080
COPY target/*.jar /opt/app.jar
CMD ["java", "$JAVA_OPTS", "-jar", "/opt/app.jar"]