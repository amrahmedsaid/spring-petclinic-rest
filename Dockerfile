# Stage 1: Build the application with a valid Maven image
FROM maven:3.9.9-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Create the final, smaller image with only the necessary runtime files
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar ./spring-petclinic-rest.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/spring-petclinic-rest.jar"]
