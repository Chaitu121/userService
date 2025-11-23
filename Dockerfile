# -------- STAGE 1: Build the Application --------
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

# Copy pom.xml first → better layer caching
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build JAR
RUN mvn clean package -DskipTests


# -------- STAGE 2: Create Final Small Image --------
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the built jar into final image
COPY --from=build /app/target/*.jar user-service.jar

# Expose Spring Boot port (default: 8080)
EXPOSE 8080

# Run the microservice
ENTRYPOINT ["java", "-jar", "user-service.jar"]
