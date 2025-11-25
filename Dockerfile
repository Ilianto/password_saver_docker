FROM maven:3.9.6-eclipse-temurin-21-alpine AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre-alpine
EXPOSE 8080
ARG JAR_FILE=target/myapp-0.0.1-SNAPSHOT.jar
COPY --from=build /app/${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]